import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  FocusNode passwordFocusNode;
   PasswordInputField({super.key,
   required this.passwordFocusNode
   });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                    focusNode: widget.passwordFocusNode,
                    obscureText: isVisible,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          isVisible = !isVisible;
                        });
                      }, 
                      icon: Icon(
                        isVisible? Icons.visibility_off_outlined : Icons.visibility_outlined
                      )),
                      border: OutlineInputBorder(),
                      label: Bodytext(text: "Password")
                    ),
                    onChanged: (value){
        
                    },
                    onFieldSubmitted: (value){},
                    validator: (value){
                              if(value!.isEmpty){
                                return "Password is required";
                              }
                              
                              else{
                                return null;
                              }
                            },
                  );
  }
}