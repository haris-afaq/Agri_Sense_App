

// import 'package:flutter/material.dart';

// class SplashServices {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void isLogin(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3), () {
//       final user = _auth.currentUser;

//       if (user != null) {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           RouteNames.bottomNavScreen,
//           (route) => false,
//         );
//       } else {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           RouteNames.loginScreen,
//           (route) => false,
//         );
//       }
//     });
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:learnify_app/config/routes/route_names.dart';

// class SplashServices {

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   StreamSubscription<User?>? _authSubscription;

//   void isLogin(BuildContext context) {
//     _authSubscription = _auth.authStateChanges().listen((User? user) {
//       if (user != null) {
//          Timer(Duration(seconds: 3), (){
//                 Navigator.pushNamedAndRemoveUntil(context, RouteNames.bottomNavScreen, (route) => false);
//         //       Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   RouteNames.homeScreen,
//         //   (route) => false,
//         // );
//     });

//         // Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   RouteNames.homeScreen,
//         //   (route) => false,
//         // );
//       } else {
//          Timer(Duration(seconds: 3), (){
//        Navigator.pushNamedAndRemoveUntil(
//           context,
//           RouteNames.loginScreen,
//           (route) => false,
//         );
//     });
//         // Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   RouteNames.loginScreen,
//         //   (route) => false,
//         // );
//       }

//       _authSubscription?.cancel();
//     });
//   }
// }