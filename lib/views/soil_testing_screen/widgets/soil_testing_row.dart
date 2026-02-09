import 'package:agri_sense_mobile_app/config/widgets/what_we_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilTestingRow extends StatelessWidget {
  const SoilTestingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                WhatWeTest(imagePath: "assets/images/ph_level.png"),
                  SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/nitrogen.png"),
                   SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/hardness.png"),
                   SizedBox(width: 10.w,),
                   WhatWeTest(imagePath: "assets/images/potassium.png"),
                   SizedBox(width: 10.w,),
                  WhatWeTest(imagePath: "assets/images/moisture.png"),
                   SizedBox(width: 10.w,),
                 WhatWeTest(imagePath: "assets/images/texture.png"),
                ],
              ),
            );
  }
}