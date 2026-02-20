import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_events.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_states.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
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
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context , state){
        return TextFormField(
                        focusNode: widget.nameFocusNode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Bodytext(text: "Name"),
                        ),
                        onChanged: (value){
          context.read<SignupBloc>().add(UserNameChanged(userName: value));
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
      });
  }
}