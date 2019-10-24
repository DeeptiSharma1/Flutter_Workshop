import 'package:flutter/material.dart';

enum Gender { MALE, FEMALE, OTHER }

class Calories_Cal extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return Calories_State();
  }

}
class Calories_State extends State<Calories_Cal> {
  // Declare field for radio button

  Gender _genderValue = Gender.MALE;
  double _ShowCal=0.0;
  String cal="";

  //

  // Declaring textfield controller
  TextEditingController _textHeigtController = TextEditingController();
  TextEditingController _textWeightController = TextEditingController();
  TextEditingController _textAgeController = TextEditingController();

// Calculae Calories
  void cal_Calories()
  {
    setState(() {
    double weight= double.parse(_textWeightController.text);
    double height=double.parse(_textHeigtController.text);
    int age= int.parse(_textAgeController.text);
    _ShowCal = weight + height - age + 88.362;

    if(Gender.MALE=="MALE") {
      _ShowCal = weight + height - age + 88.362;
    }
    if(_genderValue.toString()=="FEMALE") {
      _ShowCal = weight + height - age + 447.593;
    }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textHeigtController.dispose();
    _textWeightController.dispose();
    _textAgeController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        body:SafeArea(
          child:Column(
            children: <Widget>[
              Image.asset('assets/images/calory.jpg'),
              SizedBox(height: 20.0),

              Row(
                children: <Widget>[
                  Text("Age",
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),
                  Container(
                    width: 250.0,
                    margin: const EdgeInsets.only(right: 10, left: 20),

                    child:TextField(
                      controller: _textAgeController,
                      cursorColor: Colors.indigo,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Enter your age here ',
                        filled: true,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.0),
              Row(

                children: <Widget>[

                  Text("Height ",
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),
                  Container(
                    width: 250.0,
                    margin: const EdgeInsets.only(right: 10, left: 20),


                    child:TextField(
                      controller: _textHeigtController,
                      cursorColor: Colors.indigo,
                      autocorrect: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter your height in meters here ',
                        filled: true,

                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[

                  Text("Weight in kg",
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),

                  Container(
                    width: 250.0,
                    margin: const EdgeInsets.only(right: 10, left: 20),

                    child:TextField(
                      controller: _textWeightController,
                      cursorColor: Colors.indigo,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Enter your weight in kg here ',
                        filled: true,
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: <Widget>[

                  Text("Sex",
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                  ),

                  FlatButton.icon(
                    label: const Text('Male'),
                    icon: Radio(
                      value: Gender.MALE,
                      groupValue: _genderValue,
                      onChanged: (Gender value) {
                        setState(() {
                          _genderValue = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        _genderValue = Gender.MALE;
                      });
                    },
                  ),

                  FlatButton.icon(
                    label: const Text('Female'),
                    icon: Radio(
                      value: Gender.FEMALE,
                      groupValue: _genderValue,
                      onChanged: (Gender value) {
                        setState(() {
                          _genderValue = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        _genderValue = Gender.FEMALE;
                      });
                    },
                  ),
                ],
              ),

              Row(
                  children: <Widget>[
                    RaisedButton(
                      child:Text("Calculate Calories",
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                      ),
                       color: Colors.red,
                       onPressed: () {
                         cal_Calories();
                       }
                    ),


                    Text("YOUR CALORIES IS :$_ShowCal "  ,
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                    ),


                    ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
