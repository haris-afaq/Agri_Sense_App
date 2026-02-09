import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/tips_tile.dart';
import 'package:agri_sense_mobile_app/views/home_screen/wedgits/history_cards.dart';
import 'package:agri_sense_mobile_app/views/home_screen/wedgits/home_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25), 
                  bottomRight: Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Heading1(title: "AgriSense", titleColor: AppColors.whiteColor,),
                            Bodytext(text: "Smart Agriculture Solutions", textColor: AppColors.whiteColor,),
                          ],
                        ),
                        Column(
                      children: [
                        // Icon(Icons.person)
                    SvgPicture.asset("assets/icons/profile_icon.svg")
                      ],
                    )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HistoryCards(number: 24, title: "Scans Done"),
                        HistoryCards(number: 8, title: "Tests Done"),
                        HistoryCards(number: 96, showPercent: true, title: "Accuracy", ),
                      ],
                    )
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    children: [
                  HomeTiles(),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              TipsTile(description: "For best disease detection results, take clear photos in \nnatural daylight showing the affected area clearly.", title: "Pro Tip")
    ],
  ),
)
          ],
        ),
      ),
    );
  }
}