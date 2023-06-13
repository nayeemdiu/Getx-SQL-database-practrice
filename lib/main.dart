import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/home_page.dart';
import 'package:get/get.dart';

import 'db/db_helper.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage() ,
    );
  }
}
