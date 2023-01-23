import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Leave_Request extends StatefulWidget {
  const Leave_Request({super.key});

  @override
  Leaverequest createState() => Leaverequest();
}
class Leaverequest extends State<Leave_Request> {
 var _value="1";
 double screenHeight = 0;
 double screenWidth = 0;
 TextEditingController from_date = TextEditingController();
 TextEditingController to_date = TextEditingController();


 @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text("Leave Request",
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
                  controller: from_date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'From Date',
                  ),
                  onTap: () async {
                    DateTime? from_pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (from_pickeddate != null){
                      setState(() {
                        from_date.text = DateFormat('dd-MM-yyyy').format(from_pickeddate);
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: to_date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'To Date',
                  ),
                  onTap: () async {
                    DateTime? to_pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (to_pickeddate != null){
                      setState(() {
                        to_date.text = DateFormat('dd-MM-yyyy').format(to_pickeddate);
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 60,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  value: _value,
                  items: [
                    DropdownMenuItem(child: Text("reqest leave for half day"),value: "1",),
                    DropdownMenuItem(child: Text("reqest leave for full day"),value: "2",),
                  ],
                  onChanged: (v){},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Reason of leave(optional)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),              minLines: 6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
                child:const Text('Send Leave Request'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}