import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  final String title;
  final Color titleColor;
  const Heading1({super.key, 
    required this.title,
     this.titleColor = AppColors.blackColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      
      style: TextStyle(fontSize: 20,
      color: titleColor,
      height: 1.2,
      fontFamily: "RobotoCondensed",
      fontWeight: FontWeight.w900,
      ),
    );
  }
}