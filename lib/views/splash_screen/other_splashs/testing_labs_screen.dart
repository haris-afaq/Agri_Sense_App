import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class TestingLabsScreen extends StatefulWidget {
  const TestingLabsScreen({super.key});

  @override
  State<TestingLabsScreen> createState() => _TestingLabsScreenState();
}

class _TestingLabsScreenState extends State<TestingLabsScreen> {
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
                  image: AssetImage("assets/images/testing_labs.png")),
              ),
        
                  SizedBox(height: 25,), 
                  Heading1(title: "Find Testing Labs"),
                  SizedBox(height: 5,),
                  Bodytext(text: "Locate nearby certified labs for professional soil and water \ntesting with sample collection guides"),

                  SizedBox(height: 35,),
                  MainButton(title: "Get Started",
                   onTap: (){
                    Navigator.pushNamed(context, RouteNames.loginScreen);
                   })
            ],
          ),
        ),
      ),
    );
  }
}