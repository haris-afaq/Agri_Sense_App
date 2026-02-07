import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:flutter/material.dart';

class PhoneNumberInputField extends StatefulWidget {
  FocusNode phoneNumberFocusNode;
   PhoneNumberInputField({super.key,
   required this.phoneNumberFocusNode
   });

  @override
  State<PhoneNumberInputField> createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                          focusNode: widget.phoneNumberFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Bodytext(text: "Phone Number"),
                          ),
                          onChanged: (value){
          
                          },
                          onFieldSubmitted: (value){},
                          validator: (value){
                            if(value!.isEmpty){
                              return "Phone Number is required";
                            }
                           
                            else{
                              return null;
                            }
                          },
                        );
  }
}