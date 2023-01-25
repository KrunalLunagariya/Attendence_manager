import 'package:AttendanceSystem/all_string.dart';
import 'package:AttendanceSystem/app_manage.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfile createState() => EditProfile();
}
class EditProfile extends State<EditProfilePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(AppbarTitleString.editProfile,
          style: AppTextStyle.blackBoldfont
        ),
      ),
      body: const SingleChildScrollView(

      ),
    );
  }
}