import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/views/testing_labs/widgets/labs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestingLabs extends StatefulWidget {
  const TestingLabs({super.key});

  @override
  State<TestingLabs> createState() => _TestingLabsState();
}

class _TestingLabsState extends State<TestingLabs> {
  final searchController= TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Testing Labs"),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(child: 
      Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Bodytext(text: "Search here..."),
              ),
            ),
            SizedBox(height: 20.h,),
           LabsCard(imagePath: "assets/images/rw_cover.png",
            labName: "Rawalpindi Water & Soil Testing Lab",
             reviews: "4.8", 
             distance: "15 Km Away", 
             service1: "Soil Testing", 
             service2: "Water Testing", 
             service3: "Construction Material",
              price: "10,000 pkr", 
              days: "3-5 Days"),
              SizedBox(height: 10.h,),
               LabsCard(imagePath: "assets/images/peshawar.png",
            labName: "Peshawar Water & Soil Testing Lab",
             reviews: "4.8", 
             distance: "150 Km Away", 
             service1: "Soil Testing", 
             service2: "Water Testing", 
             service3: "",
              price: "10,000 pkr", 
              days: "3-5 Days"),
              SizedBox(height: 50.h,),
          ],
        ),
      ),),
    );
  }
}