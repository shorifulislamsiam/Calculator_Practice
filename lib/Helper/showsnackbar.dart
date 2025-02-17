import 'package:flutter/material.dart';

MySnackbar(context, String massage){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:Text(massage))
  );
}