import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:flutter/material.dart';

class SignupTopContent extends StatelessWidget {
  const SignupTopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Center(
                  child: Image(
                    height: 150,
                    image: AssetImage("assets/images/app_logo.png")),
                ),
                SizedBox(height: 15,),
                Heading2(title: "Create an Account",
                titleColor: AppColors.blackColor,
                ),
                 SizedBox(height: 5,),
                 Bodytext(text: "Join AgriSense todaye...!"),
      ],
    );
  }
}