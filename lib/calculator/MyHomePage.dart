import 'package:flutter/material.dart';

import 'Buildbutton.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  String input = "0";
  String output = "0";
  String operand = "";
  double num1 = 0;
  double num2 = 0;
  List<String> history = [];

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "0";
        output = "0";
        operand = "";
        num1 = 0;
        num2 = 0;
      } else if (value == "=") {
        num2 = double.parse(input);
        if (operand == "+") {
          output = (num1 + num2).toString();
        } else if (operand == "-") {
          output = (num1 - num2).toString();
        } else if (operand == "*") {
          output = (num1 * num2).toString();
        } else if (operand == "/") {
          output = (num2 != 0) ? (num1 / num2).toString() : "Error";
        }
        input = output;
        history.add("$num1 $operand $num2 = $output");
      } else if (["+", "-", "*", "/"].contains(value)) {
        num1 = double.parse(input);
        operand = value;
        input = "";
      } else {
        input = input == "0" ? value : input + value;
        output = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      history[index],
                      style: const TextStyle(fontSize: 20),
                      //textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: Text(
                  operand.isEmpty
                      ? output
                      : (input.isEmpty
                      ? "$num1 $operand "
                      : operand.isEmpty
                      ? input
                      : "$input"),//$num1 $operand
                  //operand.isEmpty ? output :  "$num1 $operand $num2 \n $output",
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buildbutton(
                  digit: "7",
                  onClick: () {
                    buttonPressed("7");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "8",
                  onClick: () {
                    buttonPressed("8");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "9",
                  onClick: () {
                    buttonPressed("9");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "+",
                  onClick: () {
                    buttonPressed("+");
                  },
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buildbutton(
                  digit: "4",
                  onClick: () {
                    buttonPressed("4");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "5",
                  onClick: () {
                    buttonPressed("5");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "6",
                  onClick: () {
                    buttonPressed("6");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "-",
                  onClick: () {
                    buttonPressed("-");
                  },
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buildbutton(
                  digit: "1",
                  onClick: () {
                    buttonPressed("1");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "2",
                  onClick: () {
                    buttonPressed("2");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "3",
                  onClick: () {
                    buttonPressed("3");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "*",
                  onClick: () {
                    buttonPressed("*");
                  },
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buildbutton(
                  digit: "C",
                  onClick: () {
                    buttonPressed("C");
                  },
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "0",
                  onClick: () {
                    buttonPressed("0");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: ".",
                  onClick: () {
                    buttonPressed(".");
                  },
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "=",
                  onClick: () {
                    buttonPressed("=");
                  },
                  color: Colors.blue,
                ),
                const SizedBox(width: 5),
                Buildbutton(
                  digit: "/",
                  onClick: () {
                    buttonPressed("/");
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
