import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class SignUpRow extends StatefulWidget {
  const SignUpRow({super.key});

  @override
  State<SignUpRow> createState() => _SignUpRowState();
}

class _SignUpRowState extends State<SignUpRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Heading3(title: "Don't have an account?",
                    titleColor: AppColors.greyColor,
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RouteNames.createAccount);
                    }, 
                    child: Heading3(title: "Create Account",
                    titleColor: AppColors.darkGreenColor,
                    ))
                  ],);
  }
}