import 'dart:io';
import 'package:agri_sense_mobile_app/config/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ScanResultsScreen extends StatefulWidget {
  final File image;

  const ScanResultsScreen({super.key, required this.image});

  @override
  State<ScanResultsScreen> createState() => _ScanResultsScreenState();
}

class _ScanResultsScreenState extends State<ScanResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Scan Results"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.file(
              widget.image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(height: 20),
            Text(
              "Scan Complete!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Here are the results of your scan.",
              style: TextStyle(fontSize: 16),
            ),
            
          ],
        ),
      ),
    );
  }
}