import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/bottom_navigation_bar.dart';
import 'package:agri_sense_mobile_app/views/auth_screen/forgor_password_screen/forgot_password.dart';
import 'package:agri_sense_mobile_app/views/auth_screen/login_screen/login.dart';
import 'package:agri_sense_mobile_app/views/auth_screen/sign_up_screen/sign_up.dart';
import 'package:agri_sense_mobile_app/views/home_screen/home_screen.dart';
import 'package:agri_sense_mobile_app/views/splash_screen/other_splashs/soil_and_water_testing_screen.dart';
import 'package:agri_sense_mobile_app/views/splash_screen/other_splashs/testing_labs_screen.dart';
import 'package:agri_sense_mobile_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes{
static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case RouteNames.splashScreen:
      return MaterialPageRoute(builder: (context)=> SplashScreen());

      case RouteNames.loginScreen:
      return MaterialPageRoute(builder: (context)=> LoginScreen());

      case RouteNames.createAccount:
      return MaterialPageRoute(builder: (_)=> SignupScreen());

      case RouteNames.homeScreen:
      return MaterialPageRoute(builder: (_)=> HomeScreen());

      case RouteNames.soilAndwaterTestingScreen:
      return MaterialPageRoute(builder: (_)=> SoilAndWaterTestingScreen());

            case RouteNames.testingLabsScreen:
      return MaterialPageRoute(builder: (_)=> TestingLabsScreen());

      case RouteNames.forgotPassword:
      return MaterialPageRoute(builder: (_)=> ForgotPasswordScreen());

      case RouteNames.bottomNavScreen:
      return MaterialPageRoute(builder: (context)=> const PersistentBottom());
  
    default: 
      return MaterialPageRoute(builder: (context){
        return Scaffold(
          body: Center(
            child: Text("No Route Generated..."),
          ),
        );
      });
    
  }
}
}