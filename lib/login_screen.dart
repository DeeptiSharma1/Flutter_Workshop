
import 'package:flutter/material.dart';

import 'bmi_calculate.dart';
import 'calories_calculator.dart';
import 'home_screen.dart';

class Login_Screen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return Login_State();
  }

}
class Login_State extends State{
  // Declaring textfield controller
  TextEditingController _textNameController = TextEditingController();
  TextEditingController _textPwdController = TextEditingController();
  String _showText,_showpwd = "";

  _onPressed() {
    setState(() {
      _showText = _textNameController.text;
      _showpwd= _textPwdController.text;

    });
  }
  @override
  void dispose() {
    super.dispose();
    _textNameController.dispose();
    _textPwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text('Healthy India'),
          backgroundColor: Colors.deepOrange,
        ),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: ListView(
                children: <Widget>[
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
                    child: Text("Welcome to Health India App..",
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0,color: Colors.indigo),
                    ),
                  ),
                  SizedBox(height: 40.0),

                  TextField(
                    controller: _textNameController,
                   cursorColor: Colors.indigo,
                   decoration: InputDecoration(
                     labelText: "Enter your name ",
                     filled: true,
                     border: OutlineInputBorder(
                       borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
                       gapPadding: 10.0,
                     ),

                   ),
                 ),
                  SizedBox(height: 20.0),
                TextField(
                  controller: _textPwdController,
                  decoration: InputDecoration(
                  labelText: 'Password ',
                  filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
                      gapPadding: 10.0,
                    ),

            ),
              obscureText: true,
                ),
                  SizedBox(height: 20.0),
                  Center(
                    child: ButtonBar(

                      children: <Widget>[
                      Builder(
                        builder: (context) => RaisedButton(
                          child: Text('Log In'),
                          textColor: Colors.white,
                          color: Colors.red,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          onPressed: () {
                            _onPressed();
                            if (_textNameController.text == "Geeky" &&
                                _textPwdController.text == "Geeky") {
                              // Condition for valid user
                              Navigator.of(context).push(
                                  new MaterialPageRoute(builder:
                                      (
                                      BuildContext context) => new Home_Screen())
                              );
                            }
                            else
                              {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Please register your details!!!'),
                                  duration: Duration(seconds: 4),
                                ));
                              }

                          }
                        ),
                    ),
                      Builder(
                        builder: (context) =>RaisedButton(
                          child: Text('Sign Up'),
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          color: Colors.red,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          onPressed: (){
                            // Navigating to register screen
                            Navigator.of(context).push(
                                new MaterialPageRoute(builder:
                                    (
                                    BuildContext context) => new Calories_Cal())
                            );

                          },
                        ),
                      ),
                      ],
                    ),
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