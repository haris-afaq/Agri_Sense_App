import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/images/app_logo.png",
              height: 120,
            ),

            const SizedBox(height: 20),

   
            Text(
              "Splash Screen",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
