import 'package:agri_sense_mobile_app/bloc/login_bloc/login_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_ervents.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_states.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   LoginButton({super.key,
  required this.formKey
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) => previous.authStates != current.authStates,
      listener: (context, state){
        if(state.authStates == AuthStates.loading){
          CustomSnackbar.show(
            context,
            text: "Loading please wait...!",
            backgroundColor: AppColors.greyColor,
          );
          
        }
        else if(state.authStates == AuthStates.error){
          CustomSnackbar.show(context,
           text: "Something went wrong please try again...!",
           backgroundColor: AppColors.redColor
           );
        }
        else if(state.authStates == AuthStates.success){
          CustomSnackbar.show(context,
           text: "Account successfully loggedin",
           backgroundColor: AppColors.darkGreenColor
           );

            Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.bottomNavScreen,
          (route) => false,
        );
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(builder: (context, state){
        return MainButton(
            title: "Login",
            onTap: () {
              context.read<LoginBloc>().add(LoginButtonClicked());
              print(state.email.toString());
              print(state.password.toString());
            },
          );
      }),
    );
  }
}