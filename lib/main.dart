
import 'package:calculator/water_tracker/watertracker.dart';
import 'package:flutter/material.dart';

//import 'calculator/MyHomePage.dart';
//import 'expence_tracker/Expencetracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const watertracker(), //Expencetracker(),//Myhomepage(),
      debugShowCheckedModeBanner: false,

    );
  }
}



