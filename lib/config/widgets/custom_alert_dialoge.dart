import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDiaglogeBox {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,

    String? primaryButtonText,
    VoidCallback? onPrimaryPressed,

    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,

    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext dialogContext) { 
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(message),
          actions: [
            if (secondaryButtonText != null)
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(); 
                  onSecondaryPressed?.call();
                },
                child: Text(
                  secondaryButtonText,
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            if (primaryButtonText != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreenColor,
                  shadowColor: AppColors.greyColor.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); 
                  onPrimaryPressed?.call();
                },
                child: Text(
                  primaryButtonText,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
          ],
        );
      },
    );
  }
}

// class CustomAlertDiaglogeBox {
//   static Future<void> show(
//     BuildContext context, {
//     required String title,
//     required String message,


//     String? primaryButtonText,
//     VoidCallback? onPrimaryPressed,

//     String? secondaryButtonText,
//     VoidCallback? onSecondaryPressed,

//     bool barrierDismissible = true,
//   }) {
//     return showDialog(
//       context: context,
//       barrierDismissible: barrierDismissible,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: AppColors.whiteColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusGeometry.circular(10),
//           ),
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             if (secondaryButtonText != null)
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); 
//                   onSecondaryPressed?.call();  
//                 },
//                 child: Text(secondaryButtonText,
//                 style: TextStyle(color: AppColors.blackColor),
//                 ),
//               ),

//             if (primaryButtonText != null)
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.darkGreenColor,
//                   shadowColor: AppColors.greyColor.withOpacity(.5),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(3),
//                   )
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop(); 
//                   onPrimaryPressed?.call();   
//                 },
//                 child: Text(primaryButtonText,
//                 style: TextStyle(color: AppColors.whiteColor),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }