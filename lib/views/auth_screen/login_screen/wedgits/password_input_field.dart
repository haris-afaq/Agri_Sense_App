import 'package:agri_sense_mobile_app/bloc/login_bloc/login_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_ervents.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_states.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
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
    return  BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state){
      return TextFormField(
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
        context.read<LoginBloc>().add(PasswordChanged(password: value));
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
    });
  }
}