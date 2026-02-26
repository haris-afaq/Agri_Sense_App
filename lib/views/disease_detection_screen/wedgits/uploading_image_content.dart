import 'dart:io';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:agri_sense_mobile_app/resources/model_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadingImageContent extends StatefulWidget {
  final File? image;
  final ValueChanged<File?> onImageChanged;

  const UploadingImageContent({
    super.key,
    this.image,
    required this.onImageChanged,
  });

  @override
  State<UploadingImageContent> createState() => _UploadingImageContentState();
}

class _UploadingImageContentState extends State<UploadingImageContent> {
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickFromCamera() async {
    if (_isLoading) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
      
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        widget.onImageChanged(file);
      }
    } catch (e) {
      print("Camera error: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickFromGallery() async {
    if (_isLoading) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
      
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        widget.onImageChanged(file);
      }
    } catch (e) {
      print("Gallery error: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.image;
    final controller = Provider.of<ModelController>(context);

    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(10),
          dashPattern: [14, 7],
          strokeWidth: 2,
          color: AppColors.shadowGreyColor),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: GestureDetector(
                            onTap: () => widget.onImageChanged(null),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.redColor,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.close_rounded,
                                color: AppColors.whiteColor,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        if (_isLoading)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black54,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                      ],
                    )
                  : Column(
                      children: [
                        const Icon(
                          Icons.image_rounded,
                          color: AppColors.shadowGreyColor,
                          size: 45,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        const Heading3(
                          title: "Upload Crop Image",
                          titleColor: AppColors.blackColor,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        const Bodytext(
                          text: "Take a clear picture of the affected area.",
                          textColor: AppColors.greyColor,
                        ),
                      ],
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              
              if (!controller.modelLoaded) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Bodytext(
                      text: "Loading AI model...",
                      textColor: AppColors.darkGreenColor,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: (_isLoading || !controller.modelLoaded) ? null : _pickFromCamera,
                      child: Row(
                        children: const [
                          Icon(Icons.photo_camera_rounded,
                              color: AppColors.whiteColor, size: 15),
                          SizedBox(width: 10),
                          Heading3(title: "Camera", titleColor: AppColors.whiteColor),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: const BorderSide(color: AppColors.darkGreenColor),
                        ),
                      ),
                      onPressed: (_isLoading || !controller.modelLoaded) ? null : _pickFromGallery,
                      child: Row(
                        children: const [
                          Icon(Icons.image_rounded,
                              color: AppColors.darkGreenColor, size: 15),
                          SizedBox(width: 10),
                          Heading3(
                              title: "Gallery",
                              titleColor: AppColors.darkGreenColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}