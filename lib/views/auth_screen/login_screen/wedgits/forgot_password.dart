import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class ForgotpassowrdButton extends StatefulWidget {
  const ForgotpassowrdButton({super.key});

  @override
  State<ForgotpassowrdButton> createState() => _ForgotpassowrdButtonState();
}

class _ForgotpassowrdButtonState extends State<ForgotpassowrdButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RouteNames.forgotPassword);
                    }, 
                    child: Heading3(title: "Forgot Password?",
                    titleColor: AppColors.darkGreenColor,
                    ))
                  ],);
  }
}