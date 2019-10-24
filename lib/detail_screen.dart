import 'dart:core';

import 'package:flutter/material.dart';

import 'bmi_calculate.dart';
import 'calories_calculator.dart';
import 'home_screen.dart';

class Detail_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Detail_State();
  }

}
class Detail_State extends State<Detail_Screen>
{

  String Heading=" Good nutrition, daily exercise and adequate sleep are the foundations of healthy living. "
                    "A healthy lifestyle keeps you fit, energetic and at reduced risk for disease. ";
  String body=" According to WHO, Healthy living is a way of living that helps you enjoy more aspects of your life. It is a way of living that lowers the risk of being seriously ill or dying early. "
      "Health is not just about avoiding a disease or illness. ";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: ListView(
                children: <Widget>[

                  Image.asset('assets/images/healthyindia.jpg'),
                  SizedBox(height: 30.0),

                  Text(Heading,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                ),
                  SizedBox(height: 20.0),

                  Text(body,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}