import 'package:agri_sense_mobile_app/views/help_and_support/help_and_support_screen.dart';
import 'package:agri_sense_mobile_app/views/history_screen/history_screen.dart';
import 'package:agri_sense_mobile_app/views/home_screen/home_screen.dart';
import 'package:agri_sense_mobile_app/views/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';




class PersistentBottom extends StatefulWidget {
  const PersistentBottom({super.key});

  @override
  State<PersistentBottom> createState() => _PersistentBottomState();
}

class _PersistentBottomState extends State<PersistentBottom> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        context,
        controller: controller,
        screens: const [
          HomeScreen(),
          SettingsScreen(),          
          HistoryScreen(),
          HelpAndSupportScreen(),

        ],
        items: [
          PersistentBottomNavBarItem(
  icon: SvgPicture.asset(
    'assets/icons/home_active.svg',
    width: 40,
    height: 40,
  ),
  inactiveIcon: SvgPicture.asset(
    'assets/icons/home_inactive.svg',
    width: 40,
    height: 40,
  ),
),

  PersistentBottomNavBarItem(
  icon: SvgPicture.asset(
    'assets/icons/settings_active.svg',
    width: 40,
    height: 40,
  ),
  inactiveIcon: SvgPicture.asset(
    'assets/icons/settings_inactive.svg',
    width: 40,
    height: 40,
  ),
),
          
              PersistentBottomNavBarItem(
  icon: SvgPicture.asset(
    'assets/icons/history_active.svg',
    width: 40,
    height: 40,
  ),
  inactiveIcon: SvgPicture.asset(
    'assets/icons/history_inactive.svg',
    width: 40,
    height: 40,
  ),
),
              PersistentBottomNavBarItem(
  icon: SvgPicture.asset(
    'assets/icons/help_active.svg',
    width: 40,
    height: 40,
  ),
  inactiveIcon: SvgPicture.asset(
    'assets/icons/help_inactive.svg',
    width: 40,
    height: 40,
  ),
),
          
        ],
        navBarStyle: NavBarStyle.style6,
        padding: const EdgeInsets.only(top: 7, bottom: 5),
      ),
    );
  }
}