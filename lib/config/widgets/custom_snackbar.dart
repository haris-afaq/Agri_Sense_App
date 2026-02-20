import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar(String string);

  static void show(
    BuildContext context, {
    required String text,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColors.whiteColor,
       content: Text(
  text,
  style: textStyle ?? const TextStyle(color: AppColors.whiteColor),
),
backgroundColor: backgroundColor ?? AppColors.lightGreenColor,
      )
    );
  }
}