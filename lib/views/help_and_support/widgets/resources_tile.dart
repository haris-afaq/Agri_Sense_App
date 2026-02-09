import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class ResourcesTile extends StatelessWidget {
  final String title;
  final String description;
  final Widget icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const ResourcesTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.whiteColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.shadowGreyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading3(
                  title: title,
                  titleColor: AppColors.blackColor,
                ),
                const SizedBox(height: 5),
                Bodytext1(
                  text: description,
                  textColor: AppColors.blackColor,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
