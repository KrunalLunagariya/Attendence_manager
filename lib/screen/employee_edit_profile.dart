import 'package:flutter/material.dart';

class Edit_Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text("Edit Profile",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),
        // child: Stack(
        // fit: StackFit.expand,
        // clipBehavior: Clip.none,
        body: Column(
        children:[
          CircleAvatar(
            backgroundImage: AssetImage("lib/images/user.jpg"),
          ),
      Positioned(
        right: -16,
        bottom: 0,
        child: SizedBox(
          height: 46,
          width: 46,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white),
              ),
              primary: Colors.white,
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Icon(Icons.camera_alt, size: 24 ,color:Colors.deepPurple,),)
          ),
        ),
    ]
        )
    );
  }
}