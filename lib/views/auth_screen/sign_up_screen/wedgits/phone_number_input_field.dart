import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_events.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_states.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
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
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous)=> current.phoneNumber!= previous.phoneNumber,
      
      builder: (context, state){
      return TextFormField(
                          focusNode: widget.phoneNumberFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Bodytext(text: "Phone Number"),
                          ),
                          onChanged: (value){
          context.read<SignupBloc>().add(PhoneNumberChanged(phoneNumber: value));
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
    });
  }
}