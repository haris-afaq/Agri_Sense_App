import 'package:agri_sense_mobile_app/views/soil_testing_screen/soil_testing_screen.dart';
import 'package:agri_sense_mobile_app/views/testing_labs/testing_labs.dart';
import 'package:agri_sense_mobile_app/views/water_testing_screen/water_testing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeTiles extends StatefulWidget {
  const HomeTiles({super.key});

  @override
  State<HomeTiles> createState() => _HomeTilesState();
}

class _HomeTilesState extends State<HomeTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(onTap: (){}, assetPath: "assets/images/disease_detection_tab.png"),
                //Image(image: AssetImage("assets/images/disease_detection_tab.png")),
                //Image(image: AssetImage("assets/images/soil_testing.png")),
                HomeCard(onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context, 
                    screen: SoilTestingScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino
                    );

                }, assetPath: "assets/images/soil_testing.png")
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*0.008,),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(context, 
                  screen: WaterTestingScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino
                  );

                }, assetPath: "assets/images/water_testing.png"),
                // Image(image: AssetImage("assets/images/water_testing.png")),
                HomeCard(onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context, 
                    screen: TestingLabs(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                }, assetPath: "assets/images/testing_labs_tab.png")
                // Image(image: AssetImage("assets/images/testing_labs_tab.png")),
              ],
            ),
      ],
    );
  }
}





class HomeCard extends StatelessWidget {
  final VoidCallback onTap;
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const HomeCard({
    super.key,
    required this.onTap,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        width: 160.w,
        height: 160,
        fit: fit,
      ),
    );
  }
}
