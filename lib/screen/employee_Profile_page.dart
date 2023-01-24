// ignore_for_file: file_names
import 'package:AttendanceSystem/app_manage.dart';
import 'package:flutter/material.dart';
import 'employee_change_password_page.dart';
import 'employee_leave_history_page.dart';
import 'employee_profile_attendancereport_page.dart';
import '../profile_menu.dart';
import '../profile_pic.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("My Profile",
            style: AppTextStyle.blackBoldfont,
          ),
        ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Attendance Reports",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmployeeReportPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
          ),
          ProfileMenu(
            text: "Leave Request",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const LeaveHistoryPage()),
              );
              },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: "Holiday list",
            press: () {},
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: "Salary",
            press: () {},
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: "Change Password",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const ChangePasswordPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: "Sign out",
            press: () {},
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    )
    );
  }
}