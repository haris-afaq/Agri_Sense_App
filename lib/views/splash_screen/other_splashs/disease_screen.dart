import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
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
                  image: AssetImage("assets/images/disease_detection.png")),
              ),
        
                SizedBox(height: 25,), 
                Heading1(title: "Disease Detection"),
                  SizedBox(height: 5,),
                  Bodytext(text: "Upload crop images and get instant AI-powered disease \ndiagnosis with treatment recommendations"),

                  SizedBox(height: 35,),
                  MainButton(title: "Next",
                   onTap: (){
                    Navigator.pushNamed(context, RouteNames.soilAndwaterTestingScreen);
                   })
            ],
          ),
        ),
      ),
    );
  }
}