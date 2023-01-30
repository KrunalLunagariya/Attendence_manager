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
      body: Center(
      child: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(
          height: 155,
          width: 155,
          child: Stack(fit: StackFit.expand, children: [
             const Positioned(
              right: 20,
              top: 0,
              bottom: 10,
              left: 0,
              child: CircleAvatar(
                backgroundImage: AssetImage("lib/images/user.jpg"),
                radius: 75,
              ),
            ),
            Positioned(
                right: 0,
                bottom: 10,
                child: SizedBox(
                    height: 46,
                    child: IconButton(
                      color: AppColor.grey,
                      icon:  Icon(Icons.camera_alt,color:AppColor.blue),
                      onPressed: () {},
                    )
                )
            )]
          ),
        ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Icon(Icons.person,size: 35,color: Colors.grey,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Krunal Patel",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon:  const Icon(Icons.edit,color: Colors.blue),
                    alignment: Alignment.topRight,
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Icon(Icons.error_outline,size: 35,color: Colors.grey,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon:  const Icon(Icons.edit,color: Colors.blue),
                    alignment: Alignment.topRight,
                    onPressed: () {}
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Icon(Icons.call,size: 35,color: Colors.grey,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "12345 67899",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Icon(Icons.email,size: 35,color: Colors.grey,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Krunalpatel111@gmail.com",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
            ),
          ]),
            )
          )
    );
  }
}