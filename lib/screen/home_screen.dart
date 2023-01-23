import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'employee_punch_page.dart';
import 'employee_report_page.dart';
import 'employee_Profile_page.dart';
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;
  final screens=[
    const CheckIn(),
    const Employee_Report(),
          ListWorkingHours(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: screens[page],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: Colors.deepPurple,
        color: Colors.white,
        backgroundColor: Colors.transparent,
        items:  <Widget>[
          Icon(Icons.alarm_on_rounded, size: 30, color: (page == 0)? Colors.white : Colors.black,),
          Icon(Icons.calendar_month_rounded, size: 30,color: (page == 1)? Colors.white : Colors.black,),
          Icon(Icons.person, size: 30,color: (page == 2)? Colors.white : Colors.black,),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (screens) => true,
      ),
    );
  }
}
