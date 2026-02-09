import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class TestingTipsTile extends StatelessWidget {

  final String title;
  final String description;

  const TestingTipsTile({super.key,
  required this.title,
  required this.description,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.shadowGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading3(title: title,
            titleColor: AppColors.blackColor,
            ),
            Bodytext1(text: description,
            textColor: AppColors.blackColor,
            )
          ],
        ),
      ),
    );
  }
}