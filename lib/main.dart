import 'package:flutter/material.dart';
import 'apiServices.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  ApiDemoModel? todoData;
  @override
  void initState() {
    super.initState();

  }
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
          if(todoData != null)
          Column(children: [
            Text("${todoData!.id}"),
            Text("${todoData!.title}"),
            if(todoData!.completed == true)
            Text("completed"),
            if(todoData!.completed != true)
            Text("pending"),
          ],),
          

          ElevatedButton(
          onPressed: ()async {
            print("clicked on button");
             
             // assigning value of recieved to the variable
             todoData = await ApiDemo().getAllAPiData(todoId: count);
             setState(() {
               count = count + 1;
               
             });
          }, 
          child: const Text("get todo data"))
        ],)
      ),
    );
  }
}
