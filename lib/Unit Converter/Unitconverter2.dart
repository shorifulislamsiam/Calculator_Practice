import 'package:flutter/material.dart';

class Unitconverter2 extends StatefulWidget {
  const Unitconverter2({super.key});

  @override
  State<Unitconverter2> createState() => _Unitconverter2State();
}

class _Unitconverter2State extends State<Unitconverter2> {
  TextEditingController _inputController = TextEditingController();
  String _fromUnit = "Meters";
  String _toUnit = "kilometer";
  double result =0.0;
  final Map<String,double> _convertionTypes={
    "Meters": 1,
    "kilometer": 0.001,
    "feet": 3.28,
    "inch": 39.37,
    "centimeter":100,
  };

  void convert() {
    double input = double.tryParse(_inputController.text) ?? 0;
    if (input > 0) {
      result = input * (_convertionTypes[_toUnit]! / _convertionTypes[_fromUnit]!);
    } else {
      result = 0.0;
    }
    setState(() {
      //result =result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Value",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              DropdownButton<String>(
                value: _fromUnit,
                  items: _convertionTypes.keys.map((unit){
                    return DropdownMenuItem(child: Text(unit),value: unit,);
                  }).toList(),
                  onChanged: (value){
                  setState(() {
                    _fromUnit = value!;
                  });
                  },
              ),
              DropdownButton<String>(
                value: _toUnit,
                  items: _convertionTypes.keys.map((unit){
                    return DropdownMenuItem(value: unit ,child: Text(unit));
                  }).toList(),
                  onChanged: (value){
                  setState(() {
                    _toUnit =value!;
                  });
                  }
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_inputController.text.isNotEmpty) {
                  convert();
                }
              },
              child: Text('Convert'),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text("Result: ${result.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
