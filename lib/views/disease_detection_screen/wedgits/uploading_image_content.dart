import 'dart:io';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _pickFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedFile != null) {
      widget.onImageChanged(File(pickedFile.path));
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      widget.onImageChanged(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.image;

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
                              decoration: BoxDecoration(
                                color: AppColors.redColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.close_rounded,
                                color: AppColors.blackColor,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Icon(
                          Icons.image_rounded,
                          color: AppColors.shadowGreyColor,
                          size: 45,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Heading3(
                          title: "Upload Crop Image",
                          titleColor: AppColors.blackColor,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Bodytext(
                          text: "Take a clear picture of the affected area.",
                          textColor: AppColors.greyColor,
                        ),
                      ],
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                      onPressed: _pickFromCamera,
                      child: Row(
                        children: [
                          Icon(Icons.photo_camera_rounded,
                              color: AppColors.whiteColor, size: 15),
                          SizedBox(width: 10),
                          Heading3(
                              title: "Camera", titleColor: AppColors.whiteColor),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(color: AppColors.darkGreenColor),
                        ),
                      ),
                      onPressed: _pickFromGallery,
                      child: Row(
                        children: [
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
// import 'dart:io';
// import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
// import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
// import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadingImageContent extends StatefulWidget {
//   const UploadingImageContent({super.key});

//   @override
//   State<UploadingImageContent> createState() => _UploadingImageContentState();
// }

// class _UploadingImageContentState extends State<UploadingImageContent> {
//   File? _image; 
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickFromCamera() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.camera,
//       imageQuality: 80, 
//     );

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _pickFromGallery() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 100,
//     );

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//       options: RoundedRectDottedBorderOptions(
//         radius: Radius.circular(10),
//         dashPattern: [14,7],
//         strokeWidth: 2,
//         color: AppColors.shadowGreyColor
//       ),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColors.backgroundColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _image != null
//                   ? Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.file(
//                             _image!,
//                             height: 150,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Positioned(
//                           right: 10,
//                           top: 10,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _image = null;
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: AppColors.redColor,
//                                 shape: BoxShape.circle,
//                               ),
//                               padding: EdgeInsets.all(4),
//                               child: Icon(
//                                 Icons.close_rounded,
//                                 color: AppColors.blackColor,
//                                 size: 12,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : Column(
//                       children: [
//                         Icon(
//                           Icons.image_rounded,
//                           color: AppColors.shadowGreyColor,
//                           size: 45,
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                         Heading3(
//                           title: "Upload Crop Image",
//                           titleColor: AppColors.blackColor,
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                         Bodytext(
//                           text: "Take a clear picture of the affected area.",
//                           textColor: AppColors.greyColor,
//                         ),
//                       ],
//                     ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.darkGreenColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                       ),
//                       onPressed: _pickFromCamera,
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.photo_camera_rounded,
//                             color: AppColors.whiteColor,
//                             size: 15,
//                           ),
//                           SizedBox(width: 10),
//                           Heading3(title: "Camera", titleColor: AppColors.whiteColor),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: AppColors.backgroundColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(3),
//                           side: BorderSide(color: AppColors.darkGreenColor),
//                         ),
//                       ),
//                       onPressed: _pickFromGallery,
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.image_rounded,
//                             color: AppColors.darkGreenColor,
//                             size: 15,
//                           ),
//                           SizedBox(width: 10),
//                           Heading3(title: "Gallery", titleColor: AppColors.darkGreenColor),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }