import 'package:flutter/material.dart';

class Bmicalculator extends StatefulWidget {
  const Bmicalculator({super.key});

  @override
  State<Bmicalculator> createState() => _BmicalculatorState();
}

class _BmicalculatorState extends State<Bmicalculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;

   _resultCalculator(){
     double _height= double.tryParse(_heightController.text)!;
     double _weight = double.tryParse(_weightController.text)!;

     if(_height != null && _weight != null){
       double _heightM =_height /100;
       double result = (_weight /(_heightM * _heightM));
       setState(() {
         _bmiResult = result;
       });
     }else{
       _bmiResult =0;
     }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: TextField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 55,color: Colors.grey),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Height(cm)",
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: TextField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      labelText: "Weight(kg)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green,width: 15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text("Result: ${_bmiResult.toStringAsFixed(2)}",style: TextStyle(color: Colors.black,fontSize: 22),),
          SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 60),
              backgroundColor: Colors.blue,
            ),
              onPressed: (){
              _resultCalculator();

              },
              child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 22),),
          ),
        ],
      ),
    );
  }
}
