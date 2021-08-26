import 'package:flpapp/Images.dart';
import 'package:flpapp/dashboard.dart';
import 'package:flpapp/treePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorResources.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.white,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        actions: [
          barButtons("Dashboard", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          }),
          barButtons("Tree", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TreePage()),
            );
          }),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreePage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 120,
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 20, color: ColorResources.buttonOrange),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorResources.buttonOrange, width: 2),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Image.asset(Images.profile),
              SizedBox(
                width: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  table("Name"),
                  SizedBox(
                    height: 10,
                  ),
                  table("Mobile No."),
                  SizedBox(
                    height: 10,
                  ),
                  table("Joining Date"),
                  SizedBox(
                    height: 10,
                  ),
                  table("Status"),
                  SizedBox(
                    height: 10,
                  ),
                  table("Level"),
                ],
              ),
              userInfo(1213)
            ],
          )),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget table(String rowName) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        width: 160,
        color: ColorResources.buttonDarkOrange,
        child: Text(
          rowName,
          style: TextStyle(fontSize: 20, color: ColorResources.white),
        ));
  }

  Widget userInfo(var info) {
    return Container(
        margin: EdgeInsets.only(top: 2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          dataRows("1", Colors.orange.shade300),
          dataRows("2", Colors.orange.shade400),
          dataRows("\$40", Colors.orange.shade500),
          dataRows("\$28", Colors.orange.shade600),
          dataRows("\$14", Colors.orange.shade700),
          dataRows("\$12", Colors.orange.shade800),
          dataRows("Rs. 900", Colors.orange.shade900),
        ]));
  }

  Widget dataRows(String rowNam, Color col) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        width: 160,
        color: col,
        child: Text(
          rowNam,
          style: TextStyle(fontSize: 20, color: ColorResources.white),
        ));
  }

  Widget barButtons(String txt, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            txt,
            style:
                TextStyle(fontSize: 20, color: ColorResources.buttonDarkOrange),
          ),
        ),
      ),
    );
  }
}
