import 'dart:io';
import 'package:agri_sense_mobile_app/bloc/model/model_event.dart';
import 'package:agri_sense_mobile_app/bloc/model/model_event_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_v2/tflite_v2.dart';

import '../../resources/assets_res.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final ImagePicker _picker = ImagePicker();
  bool _modelLoaded = false;

  ModelBloc() : super(ModelInitial()) {
    on<PickImageEvent>(_onPickImage);
    on<PickCameraEvent>(_onPickCamera);
    on<PredictImageEvent>(_onPredictImage);

    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      await Tflite.loadModel(
        model: AssetsRes.MODEL,
        labels: AssetsRes.LABELS,
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false,
      );
      _modelLoaded = true;
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> _onPickImage(
      PickImageEvent event, Emitter<ModelState> emit) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      emit(ModelLoading());
      add(PredictImageEvent(picked.path));
    } else {
      emit(const ModelPredictionFailure("No image selected"));
    }
  }

  Future<void> _onPickCamera(
      PickCameraEvent event, Emitter<ModelState> emit) async {
    var status = await Permission.camera.status;
    if (status.isDenied) status = await Permission.camera.request();
    if (status.isPermanentlyDenied) {
      emit(const ModelPredictionFailure(
          "Camera permission permanently denied"));
      await openAppSettings();
      return;
    }
    if (!status.isGranted) {
      emit(const ModelPredictionFailure("Camera access required"));
      return;
    }

    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      emit(ModelLoading());
      add(PredictImageEvent(picked.path));
    } else {
      emit(const ModelPredictionFailure("No photo taken"));
    }
  }

  Future<void> _onPredictImage(
      PredictImageEvent event, Emitter<ModelState> emit) async {
    if (!_modelLoaded) {
      emit(const ModelPredictionFailure("Model not loaded yet"));
      return;
    }

    emit(ModelLoading());
    try {
      final recognitions = await Tflite.runModelOnImage(
        path: event.filePath,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 3,
        threshold: 0.0,
        asynch: true,
      );

      if (recognitions == null || recognitions.isEmpty) {
        emit(const ModelPredictionFailure("No prediction found"));
        return;
      }

      final result = Map<String, dynamic>.from(recognitions[0] as Map);
      final String rawLabel = (result["label"] ?? "").toString();
      final String label = rawLabel.trim();
      final double confidence =
          (result["confidence"] is int)
              ? (result["confidence"] as int).toDouble()
              : (result["confidence"] ?? 0.0) as double;

      const double minConfidence = 0.6;
      if (confidence < minConfidence) {
        emit(const ModelPredictionFailure("Prediction confidence too low"));
        return;
      }

      emit(ModelPredictionSuccess(
        label: label,
        confidence: confidence,
        data: result,
        image: File(event.filePath),
      ));
    } catch (e) {
      emit(ModelPredictionFailure("Prediction failed: $e"));
    }
  }

  @override
  Future<void> close() {
    Tflite.close();
    return super.close();
  }
}