import 'package:flutter/material.dart';

import 'bmi_calculate.dart';
import 'calories_calculator.dart';
import 'home_screen.dart';

class Stress_Cal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Stress_State();
  }

}
class Stress_State extends State<Stress_Cal>
{

  String Heading=" Sentiment analysis has progressed to a point where it’s possible to ask relatively sophisticated questions to sentiment analysis programmes. "
      "Opinion mining was formerly confined to the simple question of whether consumers generally think a brand is good or bad.. ";
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

                  Image.asset('assets/images/mood.jpg'),
                  SizedBox(height: 30.0),

                  Text(Heading,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),
                  SizedBox(height: 20.0),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}