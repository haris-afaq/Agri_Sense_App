import 'dart:io';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:agri_sense_mobile_app/config/widgets/tips_tile.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/scan_results_screen/scan_results_screen.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/wedgits/my_drop_down.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/wedgits/scaning_overlay.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/wedgits/uploading_image_content.dart';
import 'package:flutter/material.dart';

class DiseaseDetectionScreen extends StatefulWidget {
  const DiseaseDetectionScreen({super.key});

  @override
  State<DiseaseDetectionScreen> createState() => _DiseaseDetectionScreenState();
}

class _DiseaseDetectionScreenState extends State<DiseaseDetectionScreen> {
  File? _uploadedImage; 
  bool _isScanning = false;

  void _setUploadedImage(File? image) {
    setState(() {
      _uploadedImage = image;
    });
  }

  void _startScanning() {
    if (_isScanning) return;
    
    if (_uploadedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please upload an image first"),
          backgroundColor: AppColors.logoutButtonColor,
        ),
      );
      return;
    }

    setState(() {
      _isScanning = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ScanningOverlay(image: _uploadedImage!),
    );


    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanResultsScreen(
              image: _uploadedImage!,
              predictionData: {
                "label": "peach bacterial spot",
                "confidence": 0.82,
                "index": 16,
              },
            ),
          ),
        ).then((_) {
          if (mounted) {
            setState(() {
              _isScanning = false;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "Disease Detection"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              MyDropDown(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Heading2(title: "Upload Crop Image", titleColor: AppColors.blackColor),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              UploadingImageContent(
                image: _uploadedImage,
                onImageChanged: _setUploadedImage,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TipsTile(
                title: "Tips for Best results:",
                description:
                    "*   Take photos in natural day light\n*   Focus on the effected area\n*   Avoid blury images\n*   Include multiple angles if possible",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              MainButton(
                title: "Start Scanning", 
                onTap: _startScanning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}