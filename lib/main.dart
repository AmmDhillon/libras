import 'package:flpapp/ColorResources.dart';
import 'package:flpapp/firstScreen.dart';
import 'package:flpapp/loginPage.dart';
import 'package:flpapp/remote/provider/auth_provider.dart';
import 'package:flpapp/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di_container.dart' as di;

void main() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  await di.init(sharedPreferences);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (context) => di.sl<AuthProvider>())
    ],
    child: MyApp(),
  ));
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
