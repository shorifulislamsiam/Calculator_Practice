import 'package:flutter/material.dart';

class Unitconverter extends StatefulWidget {
  const Unitconverter({super.key});

  @override
  State<Unitconverter> createState() => _UnitconverterState();
}

class _UnitconverterState extends State<Unitconverter> {
  final List<DropdownMenuItem<String>> _items = [
    DropdownMenuItem(value: "cm", child: Text("Centimeter")),
    DropdownMenuItem(value: "m", child: Text("Meter")),
    DropdownMenuItem(value: "f", child: Text("Feet")),
  ];

  String? _selectedInputUnit;
  String? _selectedOutputUnit;
  TextEditingController _inputController = TextEditingController();
  String _result = "";

  void _convert() {
    double? input = double.tryParse(_inputController.text);
    if (input != null && _selectedInputUnit != null && _selectedOutputUnit != null) {
      double result;
      if (_selectedInputUnit == "cm" && _selectedOutputUnit == "m") {
        result = input / 100;
      } else if (_selectedInputUnit == "cm" && _selectedOutputUnit == "f") {
        result = input / 30.48;
      } else if (_selectedInputUnit == "m" && _selectedOutputUnit == "cm") {
        result = input * 100;
      } else if (_selectedInputUnit == "m" && _selectedOutputUnit == "f") {
        result = input * 3.28084;
      } else if (_selectedInputUnit == "f" && _selectedOutputUnit == "cm") {
        result = input * 30.48;
      } else if (_selectedInputUnit == "f" && _selectedOutputUnit == "m") {
        result = input / 3.28084;
      } else {
        result = input;
      }
      setState(() {
        _result = result.toString();
      });
    }
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 210,
                  child: TextFormField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      labelText: "Give your input",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButton<String>(
                      items: _items,
                      value: _selectedInputUnit,
                      hint: Text("Input Unit"),
                      onChanged: (value) {
                        setState(() {
                          _selectedInputUnit = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 210,
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Result: $_result",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButton<String>(
                      items: _items,
                      value: _selectedOutputUnit,
                      hint: Text("Output Unit"),
                      onChanged: (value) {
                        setState(() {
                          _selectedOutputUnit = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _convert,
            child: Text("Convert"),
          ),
        ],
      ),
    );
  }
}
