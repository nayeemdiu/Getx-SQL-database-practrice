// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'model/controller_getx.dart';
//
// class NextPage extends StatefulWidget {
//
//   const NextPage({Key? key}) : super(key: key);
//
//   @override
//   State<NextPage> createState() => _NextPageState();
// }
//
// class _NextPageState extends State<NextPage> {
//   ControlleGetx controlleGetx = Get.put(ControlleGetx());
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//        appBar:  AppBar(title: Text('Next Page'),centerTitle: true,),
//       body: Obx(() => () =>re ListView.builder(
//         itemCount: controlleGetx.getList.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 15,
//             child: ListTile(
//               title: Text(snapshot.data![index].title.toString(),style: TextStyle(
//                 color: Colors.deepOrange,fontSize:15,
//               ),),
//               leading:  Text(snapshot.data![index].id.toString()),
//               subtitle:  Text(snapshot.data![index].body.toString(),style:TextStyle(
//                   color: Colors.black
//
//               ),),
//               trailing:  Text(snapshot.data![index].userId.toString()),
//
//             ),
//           );
//
//         },),),
//
//
//     );
//   }
// }
