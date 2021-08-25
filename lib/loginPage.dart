import 'package:flpapp/Images.dart';
import 'package:flpapp/Utils.dart';
import 'package:flutter/material.dart';

import 'ColorResources.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mobileNumberController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        ),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 100)),
              Container(
                  alignment: Alignment.topCenter,
                  height: 700,
                  width: 500,
                  child: Image.asset(Images.highfive)),
              SizedBox(
                width: 200,
              ),
              Container(
                width: 600,
                height: 600,
                child: Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Hey! Welcome Back",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorResources.buttonDarkOrange),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    inputText("Mobile Number", mobileNumberController),
                    SizedBox(
                      height: 20,
                    ),
                    inputText("Password", passwordController),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        String mobilenumber = mobileNumberController.text;
                        String password = passwordController.text;
                        if (mobilenumber.isEmpty || password.isEmpty) {
                          showSnackbar("All fields should be Filled");
                          return;
                        }
                        if (mobilenumber.length != 10) {
                          showSnackbar("Fill Valid Mobile Number");
                          return;
                        }
                        if (!Utils.isNumeric(mobilenumber)) {
                          showSnackbar("Wrong Input");
                          return;
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 63,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  ColorResources.buttonOrange,
                                  ColorResources.buttonDarkOrange,
                                ]),
                            color: ColorResources.buttonOrange,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
          SizedBox(
            height: 500,
          )
        ],
      ),
    );
  }

  Widget inputText(String lableText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorResources.buttonDarkOrange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(30),
        hintText: lableText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: ColorResources.buttonDarkOrange),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
              style: BorderStyle.none,
              width: 1,
              color: ColorResources.buttonDarkOrange),
        ),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 30),
      ),
    );
  }

  void showSnackbar(String err) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: ColorResources.buttonDarkOrange,
          content: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                err,
                style: TextStyle(fontSize: 30),
              ))),
    );
  }
}
