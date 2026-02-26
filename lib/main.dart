import 'package:agri_sense_mobile_app/views/history_screen/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'resources/model_controller.dart';
import 'config/routes/routes.dart';
import 'config/routes/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider( 
      providers: [
        ChangeNotifierProvider(create: (_) => ModelController()),
        ChangeNotifierProvider(create: (_) => HistoryController()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Agri Sense',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
// import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
// import 'package:agri_sense_mobile_app/config/routes/routes.dart';
// import 'package:agri_sense_mobile_app/firebase_options.dart';
// import 'package:agri_sense_mobile_app/views/splash_screen/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690), 
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//       return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: SplashScreen(),
//                   debugShowCheckedModeBanner: false,
//         initialRoute: RouteNames.splashScreen,
//         onGenerateRoute: Routes.generateRoute,
//       );
//       }
//     );
  
//   }
// }
