import 'package:agri_sense_mobile_app/bloc/login_bloc/login_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_ervents.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_states.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
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
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state){
      return TextFormField(
                    focusNode: widget.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email_outlined, color: AppColors.greyColor,),
                      border: OutlineInputBorder(),
                      label: Bodytext(text: "Email")
                    ),
                    onChanged: (value){
        context.read<LoginBloc>().add(EmailChanged(email: value));
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
    });
  }
}