import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class LoginRow extends StatefulWidget {
  const LoginRow({super.key});

  @override
  State<LoginRow> createState() => _LoginRowState();
}

class _LoginRowState extends State<LoginRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Heading3(title: "Already have an account?",
                      titleColor: AppColors.greyColor,
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, RouteNames.loginScreen);
                      }, 
                      child: Heading3(title: "Login Account",
                      titleColor: AppColors.darkGreenColor,
                      ))
                    ],);
  }
}