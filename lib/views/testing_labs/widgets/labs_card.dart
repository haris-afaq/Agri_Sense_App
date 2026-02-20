import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class LabsCard extends StatefulWidget {
  final String imagePath;
  final String labName;
  final String reviews;
  final String distance;
  final String service1;
  final String service2;
  final String service3;
  final String price;
  final String days;


  const LabsCard({super.key,
  required this.imagePath,
  required this.labName,
  required this.reviews,
  required this.distance,
  required this.service1,
  required this.service2,
  required this.service3,
  required this.price,
  required this.days,
  });

  @override
  State<LabsCard> createState() => _LabsCardState();
}

class _LabsCardState extends State<LabsCard> {
  @override
  Widget build(BuildContext context) {
    return  Card(
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  Image(image: AssetImage(widget.imagePath)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading3(title: widget.labName),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            ChoiceChip(label: Heading3(title: "Government"), selected: false,
                            backgroundColor: AppColors.skinColor1,
                            ),
                            SizedBox(width: 30,),
                            Icon(Icons.star, color: AppColors.reviewStarColor,size: 20,),
                            Bodytext1(text: widget.reviews, textColor: AppColors.blackColor
                            ,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, color: AppColors.greyColor,size: 20,),
                            Bodytext1(text: widget.distance, textColor: AppColors.blackColor
                            ,)
                          ],
                        ),
                          SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Bodytext1(text: widget.service1),
                          Bodytext1(text: widget.service2),
                          Bodytext1(text: widget.service3)
                          ],
                        ),
                         Divider(color: AppColors.shadowGreyColor,),
                           SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Bodytext1(text: "Starting from:"),
                          Bodytext1(text: "Results in:"),
                         
                          ],
                        ),
                          // SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Heading3(title: widget.price),
                          Heading3(title: widget.days),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}