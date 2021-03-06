import 'package:flpapp/ColorResources.dart';
import 'package:flpapp/myProfilepage.dart';
import 'package:flpapp/treePage.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.white,
        title: Text(
          "Dashboard",
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
          barButtons("Tree", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TreePage()),
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
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  table("Level"),
                  table("Team"),
                  table("Total Income"),
                  table("Auto Upgrade"),
                  table("Auto Debit"),
                  table("Total Profit"),
                  table("INR Income"),
                ],
              ),
              ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return listItem();
                  })
            ],
          )),
    );
  }

  Container listItem() {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        dataRows("1", Colors.orange.shade300),
        dataRows("2", Colors.orange.shade400),
        dataRows("\$40", Colors.orange.shade500),
        dataRows("\$28", Colors.orange.shade600),
        dataRows("\$14", Colors.orange.shade700),
        dataRows("\$12", Colors.orange.shade800),
        dataRows("Rs. 900", Colors.orange.shade900),
      ]),
    );
  }

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
