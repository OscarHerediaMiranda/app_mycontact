import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:app_mycontact/MyContactList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContactList(),
    );
  }
}