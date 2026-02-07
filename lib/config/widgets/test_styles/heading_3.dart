import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Heading3 extends StatelessWidget {
  final String title;
  final Color titleColor;
  const Heading3({super.key, 
    required this.title,
     this.titleColor = AppColors.blackColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15,
      fontFamily: "RobotoCondensed",
      color: titleColor,
      fontWeight: FontWeight.w500,
      ),
    );
  }
}