import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
 final GlobalKey<FormState> formKey;
   SignupButton({super.key,
   required this.formKey,
   });

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return MainButton(title: "Create Account", 
                         onTap: (){
                          widget.formKey.currentState!.validate();
                         });
  }
}