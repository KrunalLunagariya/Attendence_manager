import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);
  @override

  Attendance createState() => Attendance();

}

class Attendance extends State<CheckIn>{
  double screenHeight = 0;
  double screenWidth = 0;


  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Krunal Patel',
        style: TextStyle(
            color: Colors.black
        ),),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2),
              height: screenHeight / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2,2),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:Column(
                        children: const [
                          Text(
                            "Camera part",
                            style: TextStyle(
                                fontFamily: "NexaRegular",
                                fontSize: 20,
                                color: Colors.black,
                            ),
                          )
                        ],
                      )
                  ),
                ],
              )
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      // WidgetSpan(
                      //     child: Icon(Icons.access_time_rounded, color: Colors.purple,)),
                      text: DateTime.now().day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 25,
                      ),
                      children: [
                        TextSpan(
                    text: DateFormat(' MMMM yyyy / ').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth / 25,
                    ),
                  ),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        DateFormat('hh:mm:ss a').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: screenWidth / 25,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                )
    ]),

            Container(
              width: 330,
              margin: EdgeInsets.only(top: 30),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  return SlideAction(
                    text: "Check In",
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth / 20,
                    ),
                    outerColor: Colors.deepPurple,
                    innerColor: Colors.white,
                    key: key,
                    onSubmit: (){
                        key.currentState!.reset();
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

