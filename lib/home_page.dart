import 'dart:convert';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/add_task_button.dart';
import 'package:getx_api/add_task_page.dart';
import 'package:getx_api/db/db_helper.dart';
import 'package:getx_api/model/ApiServicesModel.dart';
import 'package:getx_api/model/controller_getx.dart';
import 'package:getx_api/newcontroller/task_controller.dart';
import 'package:getx_api/next_page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

             appBar: AppBar(
               elevation: 8,
              centerTitle: true,
             leading:IconButton(icon: Icon(Icons.dark_mode,color: Colors.white,), onPressed: () {
             DarkModeButton();
             },),
               actions: [
                    CircleAvatar(

                      backgroundImage: AssetImage(
                        "images/img.png"
                      ),
                    ),
                 SizedBox(width: 20,),
               ],
             ),

      body: Column(
         children: [
                _addTaskButton(),
                _addDateBar(),
                _showTasks(),



         ],
      ),
    );
  }
  _addDateBar(){

    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      child:DatePicker(
        DateTime.now(),
        height:100,
        width:80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.black,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,

        ),
        dayTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,

        ),
        monthTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,

        ),
        onDateChange: (date){
          _selectedDate= date;
        },

      ) ,


    );
  }
  _addTaskButton(){

    return   Container(
      margin:const EdgeInsets.only(left: 20,right: 20,top: 10) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                Text('Today',
                  style:TextStyle(
                      fontSize:20,
                      color: Colors.orange
                  ),),

              ],

            ),
          ),

          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              primary: Colors.white,
              elevation: 10, //<-- SEE HERE
              shadowColor: Colors.amber, //<-- SEE HERE
            ),
            onPressed: ()async {
             await  Get.to(AddTaskpage());
             taskController.getTasks();
            },
            child: const Text(
              'Add Task',
              style: TextStyle(fontSize:15),
            ),
          )
         // AddTaskButton(label: '+ Add Task', onTab: ()=>Get.to(AddTaskpage())),
        ],
      ),
    );
  }





















  //
  // body: FutureBuilder(
  // future: ControlleGetx().getApi(),
  // builder: (context, snapshot) {
  // if(snapshot.hasData){
  // return Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: Container(
  // height: 500,
  // color: Colors.green,
  // child: ListView.builder(
  // itemCount: snapshot.data!.length,
  // itemBuilder: (context, index) {
  // return Card(
  // elevation: 15,
  // child: ListTile(
  // title: Text(snapshot.data![index].title.toString(),style: TextStyle(
  // color: Colors.deepOrange,fontSize:15,
  // ),),
  // leading:  Text(snapshot.data![index].id.toString()),
  // subtitle:  Text(snapshot.data![index].body.toString(),style:TextStyle(
  // color: Colors.black
  //
  // ),),
  // trailing:  Text(snapshot.data![index].userId.toString()),
  //
  // ),
  // );
  //
  // },),
  // ),
  // );
  //
  // }
  // return CircularProgressIndicator();
  // }
  // ),
  //
  // floatingActionButton: FloatingActionButton(
  // onPressed: () {
  // // Get.to(NextPage(),);
  // Get.snackbar('Sk Nayeem Ur Rahman', 'Software Engineer at iHelpBD',
  // colorText: Colors.black,backgroundColor: Colors.orange);
  // },
  // ),





  void DarkModeButton() {

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(30)
        ),
        height: 150,

        child: Column(
          children: [
            ListTile(
              title: Text('Light Theme'),
              leading: Icon(Icons.light_mode),
              onTap: (){
                Get.changeTheme(ThemeData.light(),);
              },
            ),
            ListTile(
              title: Text('Dark Theme'),
              leading: Icon(Icons.dark_mode),
              onTap: (){
                Get.changeTheme(ThemeData.dark());
              },
            ),

          ],
        ),
      ),
    );
  }

  _showTasks() {

    return Expanded(
        child: Obx((){
       return ListView.builder(
         itemCount: taskController.taskList.length,

         itemBuilder: (context, index) {
           print( taskController.taskList.length);
             return Container(
               width: 100,
               height: 50,
               color: Colors.green,
               margin: const EdgeInsets.only(bottom: 10),
               child: Text(
                 taskController.taskList[index].title.toString(),
               ),

             );

       },);
        }),
    );

  }

}
