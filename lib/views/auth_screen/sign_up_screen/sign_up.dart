import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'wedgits/wedgits.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             SignupTopContent(),
                 SizedBox(height: 25,),
                 Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UserNameInputField(nameFocusNode: nameFocusNode),
                       SizedBox(height: 10,),
                       EmailInputField(emailFocusNode: emailFocusNode),
                        SizedBox(height: 10,),
                        PhoneNumberInputField(phoneNumberFocusNode: phoneNumberFocusNode),
                         SizedBox(height: 10,),
                         PasswordInputField(passwordFocusNode: passwordFocusNode),
                         SizedBox(height: 40,),
                         SignupButton(formKey: _formKey),
                          SizedBox(height: 10,),
                    LoginRow(),
                    ],
                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}