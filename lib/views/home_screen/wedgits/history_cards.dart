
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class HistoryCards extends StatefulWidget {
  final int number;
  final String title;
  final bool showPercent;

  const HistoryCards({super.key,
  required this.number,
  required this.title,
  this.showPercent = false,
  });

  @override
  State<HistoryCards> createState() => _HistoryCardsState();
}

class _HistoryCardsState extends State<HistoryCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
       image: DecorationImage(
        image: AssetImage(
          "assets/images/home_card_bg.png"))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.number.toString(),
          style: TextStyle(color: AppColors.darkGreenColor,
          fontFamily: "RobotoSemiCondensed",
          fontWeight: FontWeight.w700,
          fontSize: 20
          ),
          ),
          Heading3(title: widget.title, titleColor: AppColors.darkGreenColor,)
        ],
      ),
    );
  }
}