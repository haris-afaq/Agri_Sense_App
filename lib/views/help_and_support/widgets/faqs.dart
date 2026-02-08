import 'package:agri_sense_mobile_app/views/help_and_support/widgets/faqs_item.dart';
import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        SizedBox(height: 10,),
            FaqItem(question: "How does disease detection work?", 
            answer: "Our AI-powered system analyzes images of your crops to \nidentify diseases. Simply take a clear photo of the affected area, \nselect the crop type, and our system will provide detailed \nanalysis including disease name, severity, and treatment \nrecommendations."),
           
            FaqItem(question: "How accurate is the soil testing?", 
            answer: "Our quick soil test provides an estimate based on visual \nanalysis. For precise results, we recommend visiting a certified \ntesting lab. The app helps you find nearby labs and guides you \non proper sample collection."),
           
            FaqItem(question: "How do I collect soil samples correctly?", 
            answer: "Go to Soil Testing > Sample Collection Guide for detailed \nsteps. Key points: collect from 6-8 inches depth, take \nsamples from multiple spots, mix thoroughly, and submit \nto lab within 24 hours."),
           
            FaqItem(question: "What water parameters are tested?", 
            answer: "We test pH level, TDS (Total Dissolved Solids), \nhardness, chlorine, fluoride, nitrate, and sulfate levels. \nThese parameters help determine if your water is \nsuitable for irrigation."),
           
            FaqItem(question: "How do I find testing labs near me?", 
            answer: "Go to Testing Labs from the home screen. The app \nwill show certified labs in your area with ratings, \nservices offered, pricing, and contact information. \nYou can filter by government or private labs."),
           
            FaqItem(question: "Is my data secure?", 
            answer: "Yes, we take data security seriously. Your scan \nhistory and personal information are encrypted \nand stored securely. We never share your data with third \nparties without your consent."),
      ],
    );
  }
}