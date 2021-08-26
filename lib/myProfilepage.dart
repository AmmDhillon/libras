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
        body: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            (Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(Images.profile),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    infoColumns("Name", "this is Name"),
                    infoColumns("Mobile No.", "This is Mobile Number"),
                    infoColumns("Joining Date", "You Joined on 1/1/2021"),
                    infoColumns("Status", "Show Status"),
                    infoColumns("Level", "You are on Level 1")
                  ],
                ),
              ],
            )),
          ],
        ));
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget infoColumns(
    String title,
    String about,
  ) {
    return Column(
      children: [
        Container(
            width: 480,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 500,
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            about,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
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
