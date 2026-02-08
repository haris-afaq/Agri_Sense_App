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
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                          focusNode: widget.passwordFocusNode,
                          obscureText: isPasswordVisible,
                          keyboardType: TextInputType.text,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Bodytext(text: "Password"),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                               icon: Icon(isPasswordVisible? Icons.visibility_off_outlined : Icons.visibility_outlined))
                          ),
                          onChanged: (value){
          
                          },
                          onFieldSubmitted: (value){},
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password is required";
                            }
                            if(value.length <6){
                              return "Password must be greater then 6 characters";
                            }
                            else{
                              return null;
                            }
                          },
                         );
  }
}