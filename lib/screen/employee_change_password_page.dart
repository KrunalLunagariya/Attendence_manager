import 'package:flutter/material.dart';

class Change_password extends StatefulWidget {
  const Change_password({super.key});

  @override
  change_password createState() => change_password();
}
class change_password extends State<Change_password> {
   bool _obscureText = false;
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
        title: const Text("Change Password",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    labelText: 'Current Password',
                  ),
                  obscureText: _obscureText,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    labelText: 'New Password',
                  ),
                  obscureText: _obscureText,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: screenHeight/13,
                onPressed: (){
                },
                shape: const StadiumBorder(),
                color: Colors.deepPurple,
                textColor: Colors.white,
                child:const Text('Chage Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}