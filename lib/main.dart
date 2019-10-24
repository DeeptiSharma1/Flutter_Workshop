import 'dart:async';

import 'package:flutter/material.dart';

import 'bmi_calculate.dart';
import 'calories_calculator.dart';
import 'detail_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main(){
  runApp(MaterialApp(
      home: SplashScreen(),
  )
  );

}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login_Screen())));
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.1),
        child: Container(
          color: Colors.white,
          child: Column(
                  children: <Widget>[
                    SizedBox(height: 80.0),

                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset('assets/icon/ic_launcher.png',
                            width: 120,
                            fit: BoxFit.fill
                        ),
                      ),
                      radius: 70,
                      backgroundColor: Colors.transparent,

                    ),

                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                      ),
                    ),
                  ],

          ),
        ),
      ),
    );
  }

}
