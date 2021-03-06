import 'package:flpapp/dashboard.dart';
import 'package:flpapp/myProfilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorResources.dart';

class TreePage extends StatefulWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.white,
        title: Text(
          "Tree",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        actions: [
          barButtons("My Profile", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          }),
          barButtons("Dashboard", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          }),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 40),
            child: InkWell(
              onTap: () {},
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
    );
  }

  Widget barButtons(String txt, Function() ontap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
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
