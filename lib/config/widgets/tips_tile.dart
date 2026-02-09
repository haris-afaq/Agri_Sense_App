import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class TipsTile extends StatefulWidget {
  final String title;
  final String description;
  const TipsTile({super.key,
  required this.title,
    required this.description,
  });

  @override
  State<TipsTile> createState() => _TipsTileState();
}

class _TipsTileState extends State<TipsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10) ,
        image: DecorationImage(image: AssetImage(
          "assets/images/tips_bg.png"),
          fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Heading3(title: widget.title, titleColor: AppColors.blackColor,),
            SizedBox(height: 5,),
            Bodytext1(text: widget.description, textColor: AppColors.blackColor,),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}