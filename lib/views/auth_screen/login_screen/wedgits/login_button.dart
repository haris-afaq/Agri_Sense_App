import 'package:agri_sense_mobile_app/bloc/login_bloc/login_bloc.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_ervents.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_states.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_alert_dialoge.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({
    super.key,
    required this.formKey,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  //Location Dialoge
  void _showLocationDialog() {
    CustomAlertDiaglogeBox.show(
      context,
      title: "Location Permission",
      message: "This app needs access to your location to continue.",
      barrierDismissible: false,

      secondaryButtonText: "Deny",
      onSecondaryPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.bottomNavScreen,
          (route) => false,
        );
      },

      primaryButtonText: "Allow",
      onPrimaryPressed: () async {
        await _getCurrentLocation();

        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.bottomNavScreen,
          (route) => false,
        );
      },
    );
  }

//User Location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint("Location services are disabled.");
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        debugPrint("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location permission permanently denied.");
      return;
    }


    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    debugPrint("Latitude: ${position.latitude}");
    debugPrint("Longitude: ${position.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          previous.authStates != current.authStates,
      listener: (context, state) async{

        if (state.authStates == AuthStates.loading) {
          CustomSnackbar.show(
            context,
            text: "Loading please wait...!",
            backgroundColor: AppColors.greyColor,
          );
        }

        else if (state.authStates == AuthStates.error) {
          CustomSnackbar.show(
            context,
            text: "Something went wrong please try again...!",
            backgroundColor: AppColors.redColor,
          );
        }
        else if (state.authStates == AuthStates.success) {
  CustomSnackbar.show(
    context,
    text: "Account successfully logged in",
    backgroundColor: AppColors.darkGreenColor,
  );

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    _showLocationDialog();
  } else {
    //location already accessed
    await _getCurrentLocation();

    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.bottomNavScreen,
      (route) => false,
    );
  }
}

        // else if (state.authStates == AuthStates.success) {
        //   CustomSnackbar.show(
        //     context,
        //     text: "Account successfully logged in",
        //     backgroundColor: AppColors.darkGreenColor,
        //   );

        //   _showLocationDialog();
        // }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        builder: (context, state) {
          return MainButton(
            title: "Login",
            onTap: () {
              if (widget.formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginButtonClicked());
              }
            },
          );
        },
      ),
    );
  }
}
