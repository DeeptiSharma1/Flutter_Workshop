import 'package:cal_bmi_app/stress_calculate.dart';
import 'package:flutter/material.dart';

import 'bmi_calculate.dart';
import 'calories_calculator.dart';
import 'detail_screen.dart';

class Home_Screen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return Home_State();
  }

}
class Home_State extends State<Home_Screen>
{

  // Creating item for Drawer
  int _XselectedIndex = 0;


  final drawerItems = [
    new DrawerItem("Home",Icons.home),
    new DrawerItem("BMI Calculator",Icons.assignment),
    new DrawerItem("Calories",Icons.accessibility_new),
    new DrawerItem("Stress Analyzer",Icons.healing),
    new DrawerItem("Heart Risk Calculator",Icons.favorite),
  ];
  var drawerOptions = [];
  int _selectedDrawerIndex = 0;

// Add click lisener to navigation item
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Detail_Screen();
      case 1:
        return new BMI_Cal();

      case 2:
        return new Calories_Cal();
      case 3:
        return new Stress_Cal();
      default:
        return new Text("It is coming sooon.!!!!!!");
    }
  }
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    // Navigator.of(context).pop(); // close the drawer
  }

  // Adding Navigation handling fo bottom navigation

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      return new BMI_Cal();
    });
  }

  @override
  Widget build(BuildContext context) {
//
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
  //

    return MaterialApp(
          home:Scaffold(
            appBar: AppBar(
              title:Text('Healthy India'),
              backgroundColor: Colors.deepOrange,
            ),
            drawer: Drawer(
              child:Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('Deepti',style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500,color: Colors.indigo),),

                    accountEmail: Text('user1@example.com',style: new TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w500,color: Colors.indigo),),
                    currentAccountPicture:
                    Image.asset('assets/images/profile.png'),
                    decoration: BoxDecoration(color: Colors.red,shape: BoxShape.rectangle),
                  ),

                  Column(children:drawerOptions)
                ],
              ),

            ),
            body: _getDrawerItemWidget(_selectedDrawerIndex),
            //Botom Navigation

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.mail),
                  title: new Text('Messages'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Profile'),
                )
              ],
              onTap: onTabTapped,

            ),

          ),
    );
  }

}

class DrawerItem {
  String title;
 // String subtitle;
  IconData icon;
  DrawerItem(this.title, this.icon);
}