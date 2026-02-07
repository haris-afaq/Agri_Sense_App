import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:flutter/material.dart';

class UserNameInputField extends StatefulWidget {
  FocusNode nameFocusNode;
   UserNameInputField({super.key,
  required this.nameFocusNode
  });

  @override
  State<UserNameInputField> createState() => _UserNameInputFieldState();
}

class _UserNameInputFieldState extends State<UserNameInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                        focusNode: widget.nameFocusNode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Bodytext(text: "Name"),
                        ),
                        onChanged: (value){
          
                        },
                        onFieldSubmitted: (value){},
                        validator: (value){
                            if(value!.isEmpty){
                              return "Name is required";
                            }
                           
                            else{
                              return null;
                            }
                          },
                      );
  }
}