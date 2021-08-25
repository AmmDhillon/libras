import 'package:flpapp/ColorResources.dart';
import 'package:flpapp/Images.dart';
import 'package:flpapp/Utils.dart';

import 'package:flpapp/loginPage.dart';

import 'package:flpapp/remote/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nameController = TextEditingController();
  var mobileNumController = TextEditingController();
  var referredByController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: ColorResources.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Sign Up Here",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                    height: 650,
                    width: 500,
                    child: Image.asset(Images.meeting)),
                SizedBox(
                  width: 200,
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Please SignUp to Join Our Community",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorResources.buttonDarkOrange),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 600,
                      height: 800,
                      child: Expanded(
                          child: Column(
                        children: [
                          inputText("Enter Your Name", nameController,
                              "Field Can't be Empty"),
                          SizedBox(
                            height: 20,
                          ),
                          inputText(
                              "Enter Your Mobile Number",
                              mobileNumController,
                              "Enter 10 Digits Mobile Number"),
                          SizedBox(
                            height: 20,
                          ),
                          inputText("Referred By", referredByController,
                              "Field Can't be Empty"),
                          SizedBox(
                            height: 20,
                          ),
                          inputText("Enter New Password", passwordController,
                              "Field Can't be Empty"),
                          SizedBox(
                            height: 20,
                          ),
                          inputText(
                              "Re-Enter Above Password",
                              confirmPasswordController,
                              "Field Can't be Empty"),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              String name = nameController.text;
                              String mobileNum = mobileNumController.text;
                              String referredBy = referredByController.text;
                              String password = passwordController.text;
                              String confirmPassword =
                                  confirmPasswordController.text;

                              if (name.isEmpty ||
                                  mobileNum.isEmpty ||
                                  referredBy.isEmpty ||
                                  password.isEmpty ||
                                  confirmPassword.isEmpty) {
                                showSnackbar("All fields should be Filled");
                                return;
                              }

                              if (password != confirmPassword) {
                                showSnackbar("Password didn't Match");
                                return;
                              }

                              if (mobileNum.length != 10) {
                                showSnackbar(
                                    "Mobile Number Should be in 10 Digits");
                                return;
                              }

                              if (!Utils.isNumeric(mobileNum)) {
                                showSnackbar("Wrong Input");
                                return;
                              }

                              // var loggin = LoggingInterceptor();
                              // var authRepo = AuthRepo(dioClient: DioClient(baseUrl: APIConstants.BASE_URL, dio: Dio(), loggingInterceptor: loggin));
                              //
                              // AuthProvider authProvider = AuthProvider(authRepo: authRepo);
                              //
                              // authProvider.registration(name: name, mobile: mobileNum, referredBy: referredBy, password: password).then((value) async {
                              //   if (value.isSuccess) {
                              //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));
                              //   } else {
                              //     showSnackbar(value.message);
                              //   }
                              // });

                              // API Call
                              Provider.of<AuthProvider>(context, listen: false)
                                  .registration(
                                      name: name,
                                      mobile: mobileNum,
                                      referredBy: referredBy,
                                      password: password)
                                  .then((value) async {
                                if (value.isSuccess) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => LoginPage()));
                                } else {
                                  showSnackbar(value.message);
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 160,
                              height: 63,
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5),
                              width: 300,
                              height: 63,
                              child: Text(
                                "Already a Member? LogIn",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorResources.buttonOrange),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorResources.buttonOrange,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }

  Widget inputText(
      String lableText, TextEditingController controller, String errortxt) {
    return TextFormField(
        // key: _formKey,
        controller: controller,
        // validator: (controller) {
        //   if (controller!.isEmpty) return errortxt;s
        // },
        // ignore: deprecated_member_use
        // autovalidate: true,
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
        ));
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
