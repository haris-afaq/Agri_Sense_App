

import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Bodytext extends StatelessWidget {
  final String text;
  final Color? textColor;
  const Bodytext( {
    required this.text,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 12,
    color: textColor??AppColors.blackColor,
    fontFamily: "RobotoCondensed",
    fontWeight: FontWeight.w300),
    );
  }
}