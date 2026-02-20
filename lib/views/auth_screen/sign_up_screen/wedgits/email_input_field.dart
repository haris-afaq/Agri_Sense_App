import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_events.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_states.dart';
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
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (previous, current)=> previous.email != current.email,
      builder: (context, State){
      return TextFormField(
                        focusNode: widget.emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Bodytext(text: "Email"),
                        ),
                        onChanged: (value){
          context.read<SignupBloc>().add(EmailChanged(email: value));
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