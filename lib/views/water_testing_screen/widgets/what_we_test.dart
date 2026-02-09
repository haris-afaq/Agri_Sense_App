import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatWeTest extends StatelessWidget {
  final String imagePath;

  const WhatWeTest({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        image: DecorationImage(
          image: AssetImage(
            
            
            imagePath),
          // fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            debugPrint('Image not found: $imagePath');
          },
        ),
      ),
    );
  }
}


