import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'ApiServicesModel.dart';
class ControlleGetx extends GetxController{


  RxList getList = <ApiServicesModel>[].obs;
  Future<RxList> getApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    print(data);

    if(response.statusCode==200){


      for(Map i in data){

        getList.add(ApiServicesModel.fromJson(i));
      }

    }else{


    }
    return getList;
  }


}