import 'package:flutter/material.dart';
class Buildbutton extends StatelessWidget {
  String digit;
  Color ? color;
  final VoidCallback onClick;
   Buildbutton({super.key,required this.digit,this.color, required this.onClick});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        width: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color?? Colors.yellowAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          onPressed: onClick,
          child: Text(digit, style: TextStyle(fontSize: 20,color: Colors.black),),
        ),
      ),
    );
  }
}
