
import 'package:flutter/material.dart';

class BMI_Cal extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return BMI_State();
  }

}
class BMI_State extends State<BMI_Cal>
{
// Declaring textfield controller
  TextEditingController _textHeigtController = TextEditingController();
  TextEditingController _textWeightController = TextEditingController();
    double _showBMI=0.0;
    String aboutBMI=" Know your Body Mass Index (BMI) Is your body weight appropriate for your height? BMI is a gross estimate for the amount of fat in your body."
        " It tells you whether you need to lose weight or not.";



    String formula="Calculate your body mass index (BMI) to learn whether your weight is healthy or could be a health risk in the years to come."
        "BMI = Weight in kilograms / (Height in meters)2 ";
    String reult="";
  // Add function to calculate BMI
   void calculateBMI()
   {
     setState(() {

      // _showBMI = (_textHeigtController.text + _textWeightController.text) as double;

       double height= double.parse(_textHeigtController.text);
       double weight= double.parse(_textWeightController.text);
       double totl =height * height;
       print(totl);
       _showBMI= weight / totl;
       if (_showBMI >=25)
         {
           reult="You are Overweight";
         }
       if (_showBMI >=18 && _showBMI <25)
       {
         reult="You are Normal";
       }
       if (_showBMI >=25 && _showBMI<38)
       {
         reult="You are Overweight";
       }
       if (_showBMI >= 39 )
       {
         reult="You are Obese";
       }

     });
   }

  @override
  void dispose() {
    super.dispose();
    _textHeigtController.dispose();
    _textWeightController.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home:Scaffold(
        // Design boder
        body:SafeArea(

          child:Center(
            child: Column(
              children: <Widget>[

                Image.asset('assets/images/bmi_about.png'),
                SizedBox(height: 10.0),
                Text('Formula for calculating BMI: Weight/Height * Height',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 15.0,color: Colors.indigo),),
                SizedBox(height: 30.0),

                Container(

                  alignment: FractionalOffset(0,0),
                  color: Colors.white,
                  child:Center(
                    child: Table(
                      border:TableBorder.all(width: 2.0,color: Colors.indigo),
                      children:[

                        TableRow(
                          children: [
                            TableCell(
                              child:Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2, // 30%
                                    child:Text(" Height in meters",
                                      style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 3, // 20%
                                      child:TextField(
                                        controller: _textHeigtController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter your Height..",
                                          focusColor: Colors.indigo

                                        ),
                                      )

                                  ),
                                ],
                              ),
                            ),
                          ]
                        ),
                        // Add one more row

                        TableRow(
                            children: [
                              TableCell(
                                child:Row(

                                  children: <Widget>[
                                    Expanded(
                                      flex: 2, // 30%

                                      child:Text(" Weight in kg",
                                        style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),
                                      ),
                                    ),

                                    Flexible(
                                        flex: 3, // 20%
                                        child:TextField(
                                          controller: _textWeightController,

                                          decoration: InputDecoration(

                                              border: InputBorder.none,
                                              hintText: "Enter your weight..",
                                            focusColor: Colors.indigo
                                          ),
                                        )

                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        // Add one more row

                        TableRow(
                            children: [
                              TableCell(
                                child:Row(

                                  children: <Widget>[
                                    Expanded(
                                      flex: 2, // 30%

                                      child:RaisedButton(
                                        padding: const EdgeInsets.all(8.0),
                                        color: Colors.red,
                                        textColor: Colors.black,
                                        child: Text("Calculte BMI ",
                                          style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),

                                        ),
                                        onPressed: (){
                                          calculateBMI();

                                        },

                                        //onPressed: calculateBMI,

                                      ),
                                    ),

                                    Flexible(
                                        flex: 3, // 20%
                                        child:Text("Your BMIS is : $_showBMI"  ,
                                          style: TextStyle(fontFamily: 'Roboto', fontSize: 20.0,color: Colors.indigo),),
                                      //

                                        )
                                ],
                                    ),
                                  ),
                                  ],
                                ),
                        TableRow(
                            children: [
                              TableCell(
                                child:Row(
                                  children: <Widget>[

                                    Expanded(
                                      flex: 2, // 30%
                                      child:Text(
                                        reult,
                                        style: TextStyle(
                                          fontFamily: 'Spectral',
                                          color: Colors.indigo,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),

      ],

                              ),
                  ),

                      ),
              ],
            ),
          ),


            ),
            ),

            );

  }

}
// code
