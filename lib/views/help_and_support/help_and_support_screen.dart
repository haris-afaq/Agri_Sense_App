import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:agri_sense_mobile_app/views/help_and_support/widgets/faqs.dart';
import 'package:agri_sense_mobile_app/views/help_and_support/widgets/resources_tile.dart';
import 'package:agri_sense_mobile_app/views/soil_testing_screen/soil_testing_sample_guide_screen.dart';
import 'package:agri_sense_mobile_app/views/water_testing_screen/water_testing_sample_guide_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "Help & Support"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Heading2(title: "Frequently Asked Questions:",
          titleColor: AppColors.blackColor,
          ),
              Faqs(),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Heading2(title: "Resources:",
          titleColor: AppColors.blackColor,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          ResourcesTile(title: "Soil sample guide",
           description: "Learn how to collect soil", icon:
            SvgPicture.asset("assets/icons/next_icon.svg"), 
            onPressed: () { 
              PersistentNavBarNavigator.pushNewScreen(
                context, 
                screen: SoilTestingSampleGuideScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino
                );
             },),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            ResourcesTile(title: "Water sample guide",
           description: "Proper water collection methods", icon:
            SvgPicture.asset("assets/icons/next_icon.svg"), 
            onPressed: () { 
           PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: WaterTestingSampleGuideScreen(),
        withNavBar: false, 
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
             },),
            ],
          ),
        ),
      ),
    );
  }
}