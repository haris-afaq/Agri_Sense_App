import 'package:agri_sense_mobile_app/config/widgets/testing_tips_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilTestingTips extends StatelessWidget {
  const SoilTestingTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           TestingTipsTile(title: "Choose the Right Time", 
           description: "Collect samples 2-3 months before planting season. Avoid collecting immediately after fertilizer application or heavy rainfall.\n  • Best time: Early morning\n  • Avoid rainy days\n  • Wait 2 weeks after fertilization\n"),
           SizedBox(height: 10.h,),
           TestingTipsTile(title: "Gather Equipment", 
           description: "You will need clean tools to collect uncontaminated samples.\n  • Clean plastic bucket\n  • Spade or auger\n  • Clean plastic bags\n • Marker pen\n • Gloves\n "),
           SizedBox(height: 10.h,),

           TestingTipsTile(title: "Select Sampling Points", 
           description: "Divide your field into uniform areas and collect samples from multiple points.\n  • 5-10 spots per acre\n  • Avoid edges and unusual spots\n  • Mark problem areas separately\n"),
           SizedBox(height: 10.h,),

           TestingTipsTile(title: "Collect the Sample", 
           description: "Remove surface debris and dig 6-8 inches deep. Take a vertical slice of soil.\n  • Dig 6-8 inches deep\n  • Take vertical slice\n  • Collect 500g from each spot\n"),
           SizedBox(height: 10.h,),

           TestingTipsTile(title: "Mix and Store", 
           description: "Mix all samples thoroughly in a clean bucket. Remove stones and debris.\n  • Mix thoroughly\n  • Remove stones/roots\n  • Take 500g final sample\n"),
           SizedBox(height: 10.h,),

           TestingTipsTile(title: "Label and Submit", 
           description: "Put sample in clean plastic bag, label with field details, and submit to lab within 24 hours.\n  • Label clearly\n  • Include field details\n  • Submit within 24 hours\n"),
           SizedBox(height: 10.h,),
      ],
    );
  }
}