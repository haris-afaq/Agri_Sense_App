import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyAppBar({super.key,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkGreenColor,
      title: SizedBox(
        width: 250,
        child: Heading2(title: title,
        
        titleColor: AppColors.whiteColor,),
      ),
      iconTheme: IconThemeData(
        color: AppColors.whiteColor
      ),
      automaticallyImplyLeading: true,
    );
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}