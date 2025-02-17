import 'package:calculator/Helper/colorses.dart';
import 'package:flutter/material.dart';
class getbutton extends StatelessWidget {
  final int ml;
  const getbutton({super.key,required this.ml});


  @override
  Widget build(BuildContext context) {
    AllColors _allColors =AllColors();
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 15,right: 15),
      child: ListTile(
        title: Text(
          "Add more $ml ml water",
          style: _allColors.getTextstyle(22, FontWeight.bold, Colors.white),
        ),
        trailing: Icon(Icons.water_drop_outlined,color: Colors.white,),
      ),
    );
  }
}
