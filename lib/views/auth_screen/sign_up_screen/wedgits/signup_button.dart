import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_events.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_states.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButton extends StatefulWidget {
 final GlobalKey<FormState> formKey;
   SignupButton({super.key,
   required this.formKey,
   });

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupStates>(
      listenWhen: (previous, current) => previous.authStates!= current.authStates,
      listener: (context, state) {
        if (state.authStates == AuthStates.loading) {
          CustomSnackbar.show(  
            backgroundColor: AppColors.greyColor   ,
            context,
            text: ("Creating your account please wait...!"));
        } 
        else if (state.authStates == AuthStates.success) {
          CustomSnackbar.show(
            context,
            backgroundColor: AppColors.darkGreenColor,
            text: ("Account created sucessfully, Now you can login your account...!"));

Navigator.pushNamed(context, RouteNames.loginScreen);
        } 
        else if (state.authStates == AuthStates.error) {
          CustomSnackbar.show(
            backgroundColor: Colors.red,
            context,
            text: ("Something went wrong while creating account...!")
          );
        }
      },
    child: BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) => false,
      builder: (context, state){
      return  MainButton(title: "Create Account", 
                         onTap: (){
                          if(widget.formKey.currentState!.validate()){
                            context.read<SignupBloc>().add(CreateAccountButton());
                          }
                         });
    }));
  }
}