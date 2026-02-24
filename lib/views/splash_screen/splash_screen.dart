import 'dart:async';
import 'package:flutter/material.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/services/splash_screen_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      _splashServices.isLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Image(
            height: 250,
            width: 250,
            image: const AssetImage("assets/images/app_logo.png"),
          ),
        ),
      ),
    );
  }
}