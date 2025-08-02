
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height=170.00;
  double weight=65.00;


  double get bmi{
    double heightInMeter=height / 100;
    return weight/(heightInMeter*heightInMeter);
  }

  String get category{
    double currentBmi=bmi;
    if(currentBmi<18.5) return "Underweight";
    if(currentBmi<24.9) return "Normal";
    if(currentBmi<29.9) return "Overweight";
    return "Obesity";



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Height : ${height.toInt()} cm"),
          Slider(value: height,
              min: 100,
              max: 220,
              divisions: 120,
              label: "${height.toInt()} cm",
              onChanged: (value){
            setState(() {
              height=value;
              
            });
              }


          ),
          Text("Weight : ${weight.toInt()} kg"),
          Slider(value: weight,
              min: 30,
              max: 150,
              divisions: 120,
              label: "${weight.toInt()} kg",
              onChanged: (value){
                setState(() {
                  weight=value;

                });
              }


          ),
          SizedBox(
            height: 40,
          ),
          Text("Your BMI is : ${bmi.toStringAsFixed(1)}",style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold

          ),),
          SizedBox(
            height: 20,
          ),
          Text("Category : ${category}",style: TextStyle(
            fontSize: 22,color: Colors.blueGrey

          ),),

          
        ],
      ),
    );
  }
}
