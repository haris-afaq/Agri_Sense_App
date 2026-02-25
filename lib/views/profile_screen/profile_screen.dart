import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/routes/route_names.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_alert_dialoge.dart';
import 'package:agri_sense_mobile_app/config/widgets/main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // Logout User
  void _logout() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      RouteNames.loginScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(title: "My Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            MainButton(
              title: "Logout",
              color: AppColors.logoutButtonColor,
              onTap: () {
                CustomAlertDiaglogeBox.show(
                  context,
                  title: "Logout Account",
                  message: "Are you sure you want to logout your account?",
                  barrierDismissible: false,

                  secondaryButtonText: "No",
                  onSecondaryPressed: () {
                    debugPrint("Logout cancelled");
                  },

                  primaryButtonText: "Yes",
                  onPrimaryPressed: () {
                    _logout();
                    debugPrint(
                      "Account Logout for:\n   ${FirebaseAuth.instance.currentUser}",
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}