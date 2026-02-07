import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {

  FocusNode emailFocusNode;

   EmailInputField({super.key,
  required this.emailFocusNode
  });

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    focusNode: widget.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email_outlined, color: AppColors.greyColor,),
                      border: OutlineInputBorder(),
                      label: Bodytext(text: "Email")
                    ),
                    onChanged: (value){
        
                    },
                    onFieldSubmitted: (value){},
                    validator: (value){
                              if(value!.isEmpty){
                                return "Email is required";
                              }
                             
                              else{
                                return null;
                              }
                            },
                  );
  }
}