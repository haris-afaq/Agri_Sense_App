import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailfocusNode =  FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailfocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "Forgot Password",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Center(child: Bodytext(text: "Enter email address associated with your account and \nwe’ll send an email with instructions to reset your \npassword...!")),
          
            SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: emailfocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Bodytext(text: "Email"),
                    ),
                    onChanged: (value){},
                    onFieldSubmitted: (value){},
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your email address";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 50,),
                  MainButton(title: "Forgot Password", onTap: (){
                    _formKey.currentState!.validate();
                  }),
                ],
            ))
          ],
                ),
        )),
    );
  }
}