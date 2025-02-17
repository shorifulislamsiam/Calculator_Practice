import 'package:flutter/material.dart';

  MyAlertDialog(context,Function onDelete){
    return showDialog(
        context: context,
        builder: (context ){
          return Expanded(
              child: AlertDialog(
                backgroundColor: Colors.grey.shade800,
                title: const Text("Alert",style: TextStyle(color: Colors.white),),
                content: const Text(
                    "Do you want to delete it?",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade500,
                    ),
                      onPressed: (){
                        //here will be delete function
                        onDelete();
                        Navigator.pop(context);

                      },
                      child: const Text(
                          "Yes",
                        style: TextStyle(color: Colors.white),
                      ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text(
                        "No",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
          );
        },
    );
  }
