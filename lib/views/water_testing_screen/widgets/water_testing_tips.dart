import 'package:agri_sense_mobile_app/config/widgets/testing_tips_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterTestingTips extends StatelessWidget {
  const WaterTestingTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                   TestingTipsTile(title: "Choose Collection Time", 
           description: "Collect water samples during normal irrigation time to get accurate representation.\n  • During irrigation hours\n  • Avoid after heavy rain\n  • Morning is preferred"),
           SizedBox(height: 10.h,),
                      TestingTipsTile(title: "Prepare Container", 
           description: "Use clean, sterile plastic bottles. Rinse with the water to be tested 2-3 times.\n  • Use sterile bottles\n  • Rinse 2-3 times\n  • 1-liter capacity\n  • Avoid touching inside"),
                      SizedBox(height: 10.h,),
           TestingTipsTile(title: "Collect from Source", 
           description: "Collect directly from your irrigation source - well, borewell, canal, or pond.\n  • From irrigation source\n  • Let water run 2-3 minutes\n  • Avoid surface water"),
           SizedBox(height: 10.h,),
                      TestingTipsTile(title: "Proper Collection Method", 
           description: "For wells: Use clean rope and bucket. For taps: Let water run before collecting.\n  • Fill bottle completely\n  • Rinse 2-3 times\n  • Avoid air bubbles\n  • Don't touch rim"),
                      SizedBox(height: 10.h,),
                      TestingTipsTile(title: "Seal and Label", 
           description: "Close the bottle tightly. Label with source, date, time, and location details.\n  • Seal tightly\n  • Label clearly\n  • Include source type\n  • Note collection time"),
                      SizedBox(height: 10.h,),
                      TestingTipsTile(title: "Store and Transport", 
           description: "Keep sample cool and away from sunlight. Submit to lab within 6 hours for best results.\n  • Keep cool\n  • Avoid sunlight\n  • Submit within 6 hours\n  • Don't freeze"),
      ],
    );
  }
}