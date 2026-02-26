import 'dart:io';
import 'package:agri_sense_mobile_app/resources/assets_res.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/scan_results_screen/scan_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ModelController extends ChangeNotifier {
  final picker = ImagePicker();
  XFile? file;
  Map<String, dynamic> data = {};

  bool _modelLoaded = false;
  bool get modelLoaded => _modelLoaded;
  
  String _modelLoadError = '';
  String get modelLoadError => _modelLoadError;

  ModelController() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      print("📱 Attempting to load model from: ${AssetsRes.MODEL}");
      print("📱 Attempting to load labels from: ${AssetsRes.LABELS}");
      
      final res = await Tflite.loadModel(
        model: AssetsRes.MODEL,
        labels: AssetsRes.LABELS,
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false,
      );
      
      print("✅ TFLite model loaded successfully: $res");
      _modelLoaded = true;
      _modelLoadError = '';
      notifyListeners();
    } catch (e) {
      print("❌ Error loading TFLite model: $e");
      _modelLoaded = false;
      _modelLoadError = e.toString();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    print("📱 Closing TFLite model");
    Tflite.close();
    super.dispose();
  }

  Future<Map<String, dynamic>?> prediction(String filepath) async {
    print("🔍 Starting prediction for: $filepath");
    
    if (filepath.isEmpty) {
      print("❌ Error: Empty file path");
      return null;
    }

    if (!_modelLoaded) {
      print("❌ Model not loaded yet");
      return null;
    }

    try {
      final file = File(filepath);
      if (!await file.exists()) {
        print("❌ Error: File does not exist");
        return null;
      }
      
      final fileSize = await file.length();
      print("📸 Image file size: ${fileSize / 1024} KB");

      var recognitions = await Tflite.runModelOnImage(
        path: filepath,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 3,
        threshold: 0.0,
        asynch: true,
      );

      print("📊 Raw recognitions: $recognitions");

      if (recognitions == null || recognitions.isEmpty) {
        print("❌ No recognitions");
        return null;
      }

      final topPrediction = recognitions[0] as Map;
      
      String rawLabel = topPrediction["label"]?.toString() ?? "unknown";
      dynamic confidenceValue = topPrediction["confidence"] ?? 0.0;
      dynamic indexValue = topPrediction["index"] ?? 0;
      
      double confidence = confidenceValue is int 
          ? confidenceValue.toDouble() 
          : confidenceValue is double 
              ? confidenceValue 
              : 0.0;

      int index = indexValue is int 
          ? indexValue 
          : indexValue is double 
              ? indexValue.toInt() 
              : 0;

      String label = rawLabel.trim();
      
      print("📝 Final label: '$label' with confidence: $confidence");

      const double minConfidence = 0.3;
      
      if (confidence < minConfidence) {
        print("❌ Low confidence");
        return null;
      }

      if (label.toLowerCase().contains("background")) {
        print("❌ Background detected");
        return null;
      }

      data = {
        "label": label,
        "confidence": confidence,
        "index": index,
      };

      print("✅ Accepted prediction: $data");
      notifyListeners();

      return data;
    } catch (e) {
      print("❌ Prediction failed: $e");
      return null;
    }
  }

  Future<void> pickImage(BuildContext context) async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      if (pick != null) {
        file = pick;
        notifyListeners();
        final result = await prediction(pick.path);
        if (result != null && context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanResultsScreen(
                image: File(pick.path),
                predictionData: result,
              ),
            ),
          );
        } else if (context.mounted) {
          _showMessage(context, "Detection Failed", 
              "Could not identify plant disease.");
        }
      }
    } catch (e) {
      print("❌ Gallery picking failed: $e");
    }
  }

  Future<void> pickCamera(BuildContext context) async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();
    }

    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        _showMessage(context, "Permission Required", 
            "Please enable camera in settings");
      }
      await openAppSettings();
      return;
    }

    if (!status.isGranted) {
      if (context.mounted) {
        _showMessage(context, "Permission Denied", 
            "Camera access is required");
      }
      return;
    }

    try {
      final pick = await picker.pickImage(source: ImageSource.camera);
      if (pick != null) {
        file = pick;
        notifyListeners();
        final result = await prediction(pick.path);
        if (result != null && context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanResultsScreen(
                image: File(pick.path),
                predictionData: result,
              ),
            ),
          );
        } else if (context.mounted) {
          _showMessage(context, "Detection Failed", 
              "Could not identify plant disease.");
        }
      }
    } catch (e) {
      print("❌ Camera picking failed: $e");
    }
  }

  void _showMessage(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$title: $message"),
        backgroundColor: title.contains("Failed") ? Colors.red : Colors.green,
      ),
    );
  }
}