import 'dart:async';

import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/views/splash_screen/other_splashs/disease_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



// SplashServices _splashServices = SplashServices();

// @override
// void initState() {
//   super.initState();

//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     _splashServices.isLogin(context);
//   });
// }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _splashServices = SplashServices();
  //   _splashServices.isLogin(context);
  //   // Timer(Duration(seconds: 5), (){
  //   //   Navigator.pushNamed(context, RouteNames.loginScreen);
  //   // });
  // }
@override
void initState() {
  super.initState();

  Future.delayed(const Duration(seconds: 3), () {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DiseaseScreen()),
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage("assets/images/app_logo.png")),
            ),
            // LoadingWidget(),
          ],
        )),

    );
  }
}