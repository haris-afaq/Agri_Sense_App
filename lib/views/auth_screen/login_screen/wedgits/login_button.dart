import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   LoginButton({super.key,
  required this.formKey
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return MainButton(title: "Login", 
                  onTap: (){
                    widget.formKey.currentState!.validate();
                  });
  }
}