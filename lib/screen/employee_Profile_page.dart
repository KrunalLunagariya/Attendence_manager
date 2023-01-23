import 'package:flutter/material.dart';
import 'employee_profile_attendancereport_page.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class ListWorkingHours extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text("My Profile",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Attendance Reports",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Employee_Report()),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
                thickness: 0.2,
                color: Colors.black,
              ),
          ),
          ProfileMenu(
            text: "Leave Request",
            press: () {
              },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          ProfileMenu(
            text: "Holiday list",
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          ProfileMenu(
            text: "Salary",
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          ProfileMenu(
            text: "Change Password",
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          ProfileMenu(
            text: "Sign out",
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    )
    );
  }
}