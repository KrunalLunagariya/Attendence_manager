//ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, library_private_types_in_public_api, use_build_context_synchronously
import 'package:AttendanceSystem/api_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'register_page.dart';
import '../routs.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  Loginpage createState() => Loginpage();
}

class Loginpage extends State<Home> {
  final formKey = GlobalKey<FormState>();
  //key for form
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  final service = ApiServices();
  double screenHeight = 0;
  double screenWidth = 0;

  //MARK:API Call
  callLoginApi() async{
    EasyLoading.show(status: 'loading...');
    var response =await  service.doLogin(emailText.text, passwordText.text);
    if (response != null){
      EasyLoading.dismiss();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login,(Route<dynamic> route) => false);
      // const snackBar = SnackBar(content: Text('Login Done'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Not Succesfull!'),
      ));
    }
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      key: _scaffoldKey,
      resizeToAvoidBottomInset : false,
      //backgroundColor: Colors.grey[300],
      //**************** LinearGradient *****************
      // gradient: LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomLeft,
      //   colors: [
      //     Color(0xffd1ccf6),
      //     Color(0xfffabbd4),
      //   ],
      // )
      //*************** //
        //************* Stack BackGround Image *************//
      // body: Stack(
      //   children: <Widget>[
      // SvgPicture.asset('lib/images/background.svg',
      //   fit: BoxFit.cover,
      // ),

        //*************

        body :Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/bg.png"),
                fit: BoxFit.cover
            ),
          ),        //padding: const EdgeInsets.only(left: 5, right: 5),
        child: Form(
          key: formKey, //key for form
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              //******** Top image screen start **********
              //     Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Image.asset('lib/images/top.png'),
              //   ],
              // ),
              const SizedBox(height: 170),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailText,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Enter Email",
                      contentPadding: const EdgeInsets.all(8),
                      prefixIcon: const Icon(Icons.email ,color: Colors.black),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "* Required";
                      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return 'Please Enter Correct Email';
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordText,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Enter Password",
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: const Icon(Icons.lock ,color: Colors.black),
                      ),
                      validator: (value){
                        if((value!.isEmpty)){
                          return "* Required";
                        }else if(RegExp(" ").hasMatch(value!)){
                          return ('Don\'t use Space');
                        }else{
                          return null;
                        }
                      },
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: screenWidth/1, // <-- Your width
                  height: 40,
                  onPressed: (){
                    if(formKey.currentState!.validate()){}
                    callLoginApi();
                  },
                  shape: const StadiumBorder(),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  child:const Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  Image(image: AssetImage('lib/images/google.png'),
                    width: 100,
                    height: 40,),

                  SizedBox(width: 35),

                  // apple button
                  Image(image: AssetImage('lib/images/apple.png'),
                    width: 100,
                    height: 50,),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: 'Not a member? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: ' Register now',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Regsiter()),
                          );
                        }),
                ]),
              ),
              //******** Bottom image screen start **********
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('lib/images/bottom.png'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      );
  }
}