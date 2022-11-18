import 'dart:math';

import "package:flutter/material.dart";

class BMI extends StatefulWidget {
  final String title;
  const BMI({super.key, required this.title});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String bmi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
            'images/111 bmilogo.png',
            width: 60.0,
            height: 100.0,
          ),
          
          Padding(padding: EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            color: Colors.grey,
            child: Form(
              child: Column(
                children: [
                  // Age input field

                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Age"),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    // validator: ,
                  ),

                  // Height input field
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.bar_chart_sharp),
                      label: Text("Height in meters"),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    // validator: (value) {

                    // },
                  ),

                  // Weight input field
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.balance),
                      label: Text("Weight in kg"),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    // validator: ,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(15.0),
                  ),

                  TextButton(
                    onPressed: () {
                      int height = int.parse(_heightController.text);
                      int weight = int.parse(_weightController.text);
                      setState(() {
                        bmi = (weight / pow(height, 2)).toString();
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),),
          
          Padding(
          padding: EdgeInsets.all(10.0),
          child:Text("Your bmi: $bmi",

          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
          ),),),
         
          Text("Overweight",

          style: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),),
        ],
      ),
    );
  }
}
