import 'package:calculator/BMI%20Calculator/Bmicalculator.dart';
import 'package:calculator/Helper/colorses.dart';
//import 'package:calculator/Unit%20Converter/Unitconverter.dart';
import 'package:calculator/Unit%20Converter/Unitconverter2.dart';
import 'package:flutter/material.dart';

import '../expence_tracker/Expencetracker.dart';
import '../water_tracker/watertracker.dart';

class Allicons extends StatelessWidget {
  const Allicons({super.key});

  @override
  Widget build(BuildContext context) {
    AllColors _allcolors=AllColors();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          width: 380,
          height: 200,
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 25,left: 2,right: 2),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              //spacing: 18,
              runAlignment: WrapAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Expencetracker()));
                    },
                    child: Text(
                        "Expense Tracker",
                      style: _allcolors.getTextstyle(20, FontWeight.normal, Colors.black),
                    ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>watertracker()));
                    },
                    child: Text(
                        "Water Tracker",
                      style: _allcolors.getTextstyle(20, FontWeight.bold, Colors.black),
                    ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Bmicalculator()));
                  },
                  child: Text(
                    "BMI Calculator",
                    style: _allcolors.getTextstyle(20, FontWeight.bold, Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Unitconverter2()));
                  },
                  child: Text(
                    "Unit Converter",
                    style: _allcolors.getTextstyle(20, FontWeight.bold, Colors.black),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
