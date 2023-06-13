import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/newcontroller/task_controller.dart';
import 'package:intl/intl.dart';

import 'new_model/task.dart';
class AddTaskpage extends StatefulWidget {

 AddTaskpage({Key? key}) : super(key: key);

  @override
  State<AddTaskpage> createState() => _AddTaskpageState();
}

class _AddTaskpageState extends State<AddTaskpage> {
  //inatiazation
  final TaskController taskController = Get.put(TaskController());
 TextEditingController titlecontroller = TextEditingController();
 TextEditingController notecontroller = TextEditingController();
 DateTime _selectedDate = DateTime.now();
 String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
 late String _endtTime ="11:15 pm" ;
 // Riminder
 int _selectedRemind = 5;
 List<int> remindList = [5,10,15,20];

 //Repeated time
 String  _selectedRepeat = "None";
 List<String> repetedList = ["None","Daily","weekly","Monthly"];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( actions: [
        CircleAvatar(

          backgroundImage: AssetImage(
              "images/img.png"
          ),
        ),
        SizedBox(width: 20,),
      ],),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: TextStyle( fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,),
                ),
                SizedBox(height:10),
                Container(
                  //padding: EdgeInsets.only(left: 14),

                  margin: EdgeInsets.only(top:10.0,left: 15.0,bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Title'),
                      ),

                      Row(
                      children: [
                        Expanded(
                          child:  TextFormField(
                            controller: titlecontroller,
                            autofocus: false,
                            cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                            decoration: InputDecoration(prefixIcon: Icon(Icons.title),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: context.theme.backgroundColor,width:0,
                                  ),
                                    borderRadius: (BorderRadius.all(Radius.circular(15)))),
                                labelText: 'Title',
                                hintText: 'Enter title here',
                                hoverColor:  Colors.white,

                            ),
                          ),),
                          SizedBox(height: 15,),


                      ],
                   ),
                      SizedBox(height: 15,),
                    //Note
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Note'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:  TextFormField(
                              controller: notecontroller,
                              autofocus: false,
                              cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                              decoration: InputDecoration(prefixIcon: Icon(Icons.note),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: context.theme.backgroundColor,width:0,
                                    ),
                                    borderRadius: (BorderRadius.all(Radius.circular(15)))),
                                labelText: 'Note',
                                hintText: 'Enter note here',
                                hoverColor:  Colors.white,

                              ),
                            ),),
                          SizedBox(height: 15,),


                        ],
                      ),

                      //Date
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Date'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:  TextFormField(
                            //  controller: controller,
                              autofocus: false,
                              cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                              decoration: InputDecoration(prefixIcon: Icon(Icons.date_range,),
                                border: OutlineInputBorder(

                                    borderSide: BorderSide(
                                      color: context.theme.backgroundColor,width:0,
                                    ),
                                    borderRadius: (BorderRadius.all(Radius.circular(15)))),
                                  hintText: 'dd/mm/yyy',
                                hoverColor:  Colors.white,


                              ),
                            ),),
                          SizedBox(height: 15,),




                        ],
                      ),

                      //start Time & End time Row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Start Time'),
                      ),
                      //start time
                      Row(
                        children: [
                          Expanded(
                            child:  TextFormField(
                            //  controller: controller,
                              autofocus: false,
                              cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                              decoration: InputDecoration(
                              prefix: IconButton(
                                onPressed:(){
                                        _getTimeFromUser(isStartTime: true);
                                },
                                icon:Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                              ),
                              ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: context.theme.backgroundColor,width:0,
                                    ),
                                    borderRadius: (BorderRadius.all(Radius.circular(15)))),
                                hintText: _startTime,
                                hoverColor:  Colors.white,


                              ),
                            ),),
                          SizedBox(width:5,),
                           // end time
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('End Time'),
                          ),
                          Expanded(
                            child:  TextFormField(
                           //   controller: controller,
                              autofocus: false,
                              cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                              decoration: InputDecoration(
                                prefix: IconButton(
                                  onPressed:(){
                                    _getTimeFromUser(isStartTime:false);
                                  },
                                  icon:Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: context.theme.backgroundColor,width:0,
                                    ),
                                    borderRadius: (BorderRadius.all(Radius.circular(15)))),
                                hintText: _startTime,
                                hoverColor:  Colors.white,


                              ),
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),

                      // Created Button


                      SizedBox(height: 20,),

                      OutlinedButton(onPressed: (){
                        _validateDate();

                      }, child: Text('Create Task')),

              ],
            ),
          ),
      ),
    );
  }

  void _getTimeFromUser({required bool isStartTime})async {

   var pickedTime= await  _showTimePiker();
   String _formatedTime = pickedTime.format(context);
   if(pickedTime==null){

     print("Time cancled");
   }else if(isStartTime == true){

  setState(() {
    _startTime = _formatedTime;
  });

   }else if(isStartTime == false){

  setState(() {
    _endtTime = _formatedTime;

  });
   }

    
  }

  _showTimePiker(){

    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime:TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split("")[0]) ),
    );
  }

  void _validateDate() {

          if(titlecontroller.text.isNotEmpty && notecontroller.text.isNotEmpty){
             // add to database
             _addTaskDB();
              Get.back();
          }else if(titlecontroller.text.isEmpty || notecontroller.text.isEmpty){

            Get.snackbar('Required', 'All filed are required !',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            icon: Icon(Icons.warning_amber_rounded,   color: Colors.red),);



          }

  }

  void _addTaskDB() async{

   int value = await taskController.addTask(
      task: Task(
        title: titlecontroller.text,
        note: notecontroller.text
      )

    );
   print("My id is "+"$value");

  }
}



