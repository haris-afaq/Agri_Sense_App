

import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      final user = _auth.currentUser;

      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.bottomNavScreen,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.loginScreen,
          (route) => false,
        );
      }
    });
  }
}