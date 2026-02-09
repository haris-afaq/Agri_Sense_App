import 'package:agri_sense_mobile_app/views/water_testing_screen/widgets/what_we_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatWeTestRow extends StatelessWidget {
  const WhatWeTestRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                WhatWeTest(imagePath: "assets/images/ph_level.png"),
                  SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/tds.png"),
                   SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/hardness.png"),
                   SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/chlorine.png"),
                   SizedBox(width: 10.w,),
                  WhatWeTest(imagePath: "assets/images/moisture.png"),
                   SizedBox(width: 10.w,),
                 WhatWeTest(imagePath: "assets/images/sufrace.png"),
                ],
              ),
            );
  }
}