import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'wedgits/wedgit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isVisible =true;

  final _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             LoginTopContent(),
               Form(
                key: _formKey,
                child: Column(
                children: [
                  EmailInputField(emailFocusNode: emailFocusNode),
                  SizedBox(height: 10,),
                 PasswordInputField(passwordFocusNode: passwordFocusNode),
                  ForgotpassowrdButton(),
                  SizedBox(height: 20,),
                  LoginButton(formKey: _formKey),
                  SizedBox(height: 10,),
                  SignUpRow(),
                ],
               )),
            ],
          ),
        )),
      ),
    );
  }
}