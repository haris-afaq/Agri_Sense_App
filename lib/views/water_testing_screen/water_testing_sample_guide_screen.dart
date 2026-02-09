import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/tips_tile.dart';
import 'package:agri_sense_mobile_app/views/help_and_support/widgets/resources_tile.dart';
import 'package:agri_sense_mobile_app/views/water_testing_screen/widgets/water_testing_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WaterTestingSampleGuideScreen extends StatefulWidget {
  const WaterTestingSampleGuideScreen({super.key});

  @override
  State<WaterTestingSampleGuideScreen> createState() => _WaterTestingSampleGuideScreenState();
}

class _WaterTestingSampleGuideScreenState extends State<WaterTestingSampleGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "Water Sample Collection guide",),
      body: SingleChildScrollView(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
           SizedBox(height: 25.h,),
           TipsTile(title: "Important", description: "Follow these steps carefully to ensure accurate test results. Contaminated samples will give incorrect readings."),
           SizedBox(height: 20.h,),
           WaterTestingTips(),
           SizedBox(height: 20.h,),
           ResourcesTile(
            backgroundColor: AppColors.skinColor1,
            title: "Watch video tutorial",
             description: "Step by step visual guide", 
             icon: SvgPicture.asset("assets/icons/next_icon.svg"),
              onPressed: (){}),
              SizedBox(height: 20.h,),
              MainButton(title: "Find Testing Labs", onTap: (){}),
              SizedBox(height: 20.h,),
          ],),
        ),
      ),
    );
  }
}