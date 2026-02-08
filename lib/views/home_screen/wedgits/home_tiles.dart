import 'package:flutter/material.dart';

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
                HomeCard(onTap: (){}, assetPath: "assets/images/soil_testing.png")
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.008,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(onTap: (){}, assetPath: "assets/images/water_testing.png"),
                // Image(image: AssetImage("assets/images/water_testing.png")),
                HomeCard(onTap: (){}, assetPath: "assets/images/testing_labs_tab.png")
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
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
