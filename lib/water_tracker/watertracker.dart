import 'package:calculator/Helper/colorses.dart';
import 'package:calculator/Helper/showsnackbar.dart';
import 'package:calculator/water_tracker/button.dart';
import 'package:flutter/material.dart';

class watertracker extends StatefulWidget {
  const watertracker({super.key});

  @override
  State<watertracker> createState() => _watertrackerState();
}

class _watertrackerState extends State<watertracker> {
  AllColors _allColors = AllColors();
  int _currentIntakeWater= 0 ;
  int _goal =2000;
  void _waterAdd(int amount){
    setState(() {
      if(_currentIntakeWater < _goal){
        //[if needed to add the Lower limit and Upper limit then we can set this calculation
        //_currentIntakeWater=(_currentIntakeWater+ amount).clamp(0, 2000);]
         _currentIntakeWater=(_currentIntakeWater+ amount);
      }else{
         MySnackbar(context, "Your goal is Full-fill");
      }
    });
  }
  void _resetAll(){
    setState(() {
      _currentIntakeWater=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _progress= (_currentIntakeWater / _goal);
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Water Tracker"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: _allColors.getTextstyle(25, FontWeight.bold, Colors.white),//TextStyle(fontSize: 35,color: Colors.white),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              width: sw*0.35,
              height: sh*0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Total",
                    style: _allColors.getTextstyle(25, FontWeight.bold, Colors.white),
                  ),
                  Text(
                    "$_currentIntakeWater",
                    style: _allColors.getTextstyle(25, FontWeight.bold, Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: sh*0.15,
                width: sw*0.30,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  value: _progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey.shade50
                ),
              ),
              Center(
                child: Text(
                  "${(_progress*100).toStringAsFixed(2)}%",
                  style: _allColors.getTextstyle(20, FontWeight.bold, Colors.white),
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Wrap(
            spacing: 35,
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: (){
                    _waterAdd(200);
                  },
                    child: getbutton(ml: 200,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: (){
                    _waterAdd(100);
                  },
                  child: getbutton(ml: 100,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: (){
                    _waterAdd(50);
                  },
                  child: getbutton(ml: 50,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                    onPressed: (){
                      _resetAll();
                    },
                    child: Text("Reset",style: TextStyle(color: Colors.white),)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
