import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
   // drop down list
  final List<String> dropDownItemsList = [
    "Fruits",
    "Vegetables",
    "Grains",
    "Pulses",
  ];
  //currently selected value
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: AppColors.backgroundColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.greyColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.greyColor),
                  )
                  
                ),
                hint: Text("Select a category"),
                value: selectedItem,
                isExpanded: true,
                isDense: true,
                dropdownColor: AppColors.backgroundColor,
                items: dropDownItemsList.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
              );
  }
}