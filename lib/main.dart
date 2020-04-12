import 'package:emergency/emergency_page.dart';
//import 'package:emergency/test.dart';
import 'package:flutter/material.dart';

import 'emergency_page.dart';
//import 'home_page.dart';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primaryColor: Color(0xFFd96161),
        primarySwatch: Colors.blue,
      ),
     // home: HomePage(),
     debugShowCheckedModeBanner: false,
     home:Emerpage(),
    //home: Test(),
    
    );
  }
}

