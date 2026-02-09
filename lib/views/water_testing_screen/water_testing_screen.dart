import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:agri_sense_mobile_app/config/widgets/tips_tile.dart';
import 'package:agri_sense_mobile_app/views/help_and_support/widgets/resources_tile.dart';
import 'package:agri_sense_mobile_app/views/testing_labs/testing_labs.dart';
import 'package:agri_sense_mobile_app/views/water_testing_screen/water_testing_sample_guide_screen.dart';
import 'package:agri_sense_mobile_app/views/water_testing_screen/widgets/what_we_test_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class WaterTestingScreen extends StatefulWidget {
  const WaterTestingScreen({super.key});

  @override
  State<WaterTestingScreen> createState() => _WaterTestingScreenState();
}

class _WaterTestingScreenState extends State<WaterTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "Water Testing"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            TipsTile(title: "Water Analysis", description: "Test your irrigation water for pH, TDS, hardness, and chemical content to ensure optimal crop health and yield."),
            SizedBox(height:15.h),
            Heading3(title: "What we test?"),
            SizedBox(height:3.h),
            WhatWeTestRow(),
            SizedBox(height:15.h),
            ResourcesTile(
              title: "How to collect water sample?", 
              description: "Step by step guide",
               icon: SvgPicture.asset("assets/icons/next_icon.svg"), 
               onPressed: (){
                PersistentNavBarNavigator.pushNewScreen(context, 
                screen: WaterTestingSampleGuideScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino
                );
               }),
               SizedBox(height:15.h),
               ResourcesTile(title: "Find testing labs",
                description: "Location nearby certified labs",
                 icon: SvgPicture.asset("assets/icons/next_icon.svg"), 
                 onPressed: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context, 
                    screen: TestingLabs(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino
                    );
                 })
          ],
        ),
      ),
    );
  }
}