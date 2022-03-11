import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';


class ApiDemo {

Future<ApiDemoModel> getAllAPiData({required int todoId})async {

  
  // Api url + endpint
  String url = 'https://jsonplaceholder.typicode.com/todos/$todoId';


  // Api calling with get method.
  final  res = await http.get(Uri.parse(url));
  
  print("------------------------");
  print("response $res");
  print("================");
  print("reponse body ${res.body}");


  // decoding the response data
  var jsonData = jsonDecode(res.body);

  print("json data\n $jsonData");

  print(ApiDemoModel.fromJson(jsonData).id);
  print(ApiDemoModel.fromJson(jsonData).title);
  print(ApiDemoModel.fromJson(jsonData).userId);

  // returning object of ApiDemoModel
  return ApiDemoModel.fromJson(jsonData);

} 


}



class ApiDemoModel{
  
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ApiDemoModel( { required this.userId, required this.id, required this.title, required this.completed});

  // for coverting the json data recevied from API to object
  factory ApiDemoModel.fromJson(Map<String,dynamic> json){
    return ApiDemoModel(
      userId: json['userId'], 
      id: json["id"], 
      title: json["title"], 
      completed:json["completed"]);
  }

// for coverting the object data to json for sending data to API
  Map<String,dynamic> toJson() {
    return {
      "userId": userId,
      "id": id, 
      "title": title,
      "completed": completed,

    };
  }


}