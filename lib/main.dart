import 'package:flpapp/ColorResources.dart';
// ignore: unused_import
import 'package:flpapp/firstScreen.dart';
// ignore: unused_import
import 'package:flpapp/loginPage.dart';
// ignore: unused_import
import 'package:flpapp/signupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leebras Wealth',
      theme: ThemeData(
        primaryColor: ColorResources.appbarGrey,
      ),
      home: FirstScreen(),
    );
  }
}
