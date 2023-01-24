// ignore_for_file: sort_child_properties_last

import 'package:AttendanceSystem/app_manage.dart';
import 'package:AttendanceSystem/screen/employee_leave_history_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequestPage extends StatefulWidget {
  const LeaveRequestPage({super.key});

  @override
  LeaveRequest createState() => LeaveRequest();
}
class Field {
  String fromDate;
  String toDate;
  String title;
  String reason;
  Field({required this.fromDate, required this.toDate, required this.title, required this.reason});
}
class LeaveRequest extends State<LeaveRequestPage> {

 var value="1";
 double screenHeight = 0;
 double screenWidth = 0;
 TextEditingController fromDateController = TextEditingController();
 TextEditingController toDateController = TextEditingController();
 TextEditingController titleController = TextEditingController();
 TextEditingController reasonController = TextEditingController();

 List<Field> leaveDetails = List.empty(growable: true);


 @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Leave Request",
            // style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold
            // ),
            style: AppTextStyle.blackBoldfont,
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: fromDateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'From Date',
                  ),
                  onTap: () async {
                    DateTime? fromPickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (fromPickeddate != null){
                      setState(() {
                        fromDateController.text = DateFormat('dd-MM-yyyy').format(fromPickeddate);
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: toDateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'To Date',
                  ),
                  onTap: () async {
                    DateTime? toPickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (toPickeddate != null){
                      setState(() {
                        toDateController.text = DateFormat('dd-MM-yyyy').format(toPickeddate);
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Leave Title',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                height: 60,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  value: value,
                  items: const [
                    DropdownMenuItem(child: Text("reqest leave for half day"),value: "1",),
                    DropdownMenuItem(child: Text("reqest leave for full day"),value: "2",),
                  ],
                  onChanged: (String? selectValue){
                    setState(() {
                      value = selectValue!;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextFormField(
                controller: reasonController,
                decoration: InputDecoration(
                  hintText: "Reason of leave(optional)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
                minLines: 6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: screenHeight/13,
                onPressed: () {

                  String fromDate = fromDateController.text.trim();
                  String toDate = toDateController.text.trim();
                  String title = titleController.text.trim();
                  String reason = reasonController.text.trim();

                  if (fromDate.isNotEmpty && toDate.isNotEmpty && title.isNotEmpty && reason.isNotEmpty) {
                    setState(() {
                      fromDateController.text = '';
                      toDateController.text = '';
                      titleController.text = '';
                      reasonController.text = '';
                      leaveDetails.add(Field(fromDate: fromDate, toDate: toDate,title: title,reason: reason));
                    });
                  }
                },
                shape: const StadiumBorder(),
                color: AppColor.deepPurple,
                textColor: AppColor.white,
                child:const Text('Send Leave Request'),
              ),
            ),
            const SizedBox(height: 10),
            leaveDetails.isEmpty
                ? const Text(
              'No Leaves yet..',
              style: TextStyle(fontSize: 22),
            )
                : SizedBox(
              height: 150,
                  child: ListView.builder(
                    itemCount: leaveDetails.length,
                    itemBuilder: (context, index) => getRow(index),
                  ),
                )
          ],
        ),
      ),
    );
  }
 Widget getRow(int index) {
   return Card(
     child: ListTile(
       // leading: CircleAvatar(
       //   backgroundColor:
       //   index % 2 == 0 ? AppColor.deepPurpleAccent : AppColor.purple,
       //   foregroundColor: Colors.white,
       //   child: Text(leaveDetails[index].title[0],
       //     style: AppTextStyle.boldfont,
       //   ),
       // ),
       title: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Title: ${leaveDetails[index].title}',style: AppTextStyle.boldfont,),
           Text('From Date: ${leaveDetails[index].toDate}'),
           Text('To Date: ${leaveDetails[index].toDate}'),
           Text('Reason: ${leaveDetails[index].reason}'),
         ],
       ),
     ),
   );
 }
}
