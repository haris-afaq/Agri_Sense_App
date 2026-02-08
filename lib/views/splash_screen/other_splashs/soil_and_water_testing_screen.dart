import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class SoilAndWaterTestingScreen extends StatefulWidget {
  const SoilAndWaterTestingScreen({super.key});

  @override
  State<SoilAndWaterTestingScreen> createState() => _SoilAndWaterTestingScreenState();
}

class _SoilAndWaterTestingScreenState extends State<SoilAndWaterTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
        Navigator.pushNamed(context, RouteNames.loginScreen);
                  }, child: Heading3(title: "Skip",
                  titleColor: AppColors.darkGreenColor,
                  ))
                ],
              ),
              Image(
                
                height: 150,
                
                image: AssetImage("assets/images/app_logo.png")),
              SizedBox(height: 15,), 
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image(
                     height: 250,
                  image: AssetImage("assets/images/soil_water_detection.png")),
              ),
        
                  SizedBox(height: 25,), 
                  Heading1(title: "Soil & Water Testing"),
                  SizedBox(height: 5,),
                  Bodytext(text: "Get detailed analysis of your soil and water quality with expert \nrecommendations for better yields"),

                  SizedBox(height: 35,),
                  MainButton(title: "Next",
                   onTap: (){
                    Navigator.pushNamed(context, RouteNames.testingLabsScreen);
                   })
            ],
          ),
        ),
      ),
    );
  }
}