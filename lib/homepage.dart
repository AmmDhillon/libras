import 'package:flpapp/ColorResources.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  table("Level"),
                  SizedBox(width: 20),
                  table("Team"),
                  SizedBox(width: 20),
                  table("Total Income"),
                  SizedBox(width: 20),
                  table("Auto Upgrade"),
                  SizedBox(width: 20),
                  table("Auto Debit"),
                  SizedBox(width: 20),
                  table("Total Profit"),
                  SizedBox(width: 20),
                  table("INR Income"),
                  SizedBox(width: 20),
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
      margin: EdgeInsets.only(top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        table("1"),
        SizedBox(width: 20),
        table("2"),
        SizedBox(width: 20),
        table("\$40"),
        SizedBox(width: 20),
        table("\$28"),
        SizedBox(width: 20),
        table("\$14"),
        SizedBox(width: 20),
        table("\$12"),
        SizedBox(width: 20),
        table("Rs. 900"),
        SizedBox(width: 20)
      ]),
    );
  }

  Widget table(String rowName) {
    return Container(
        alignment: Alignment.center,
        height: 80,
        width: 160,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorResources.buttonOrange,
                  ColorResources.buttonDarkOrange,
                ]),
            color: ColorResources.buttonOrange,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          rowName,
          style: TextStyle(fontSize: 20, color: ColorResources.white),
        ));
  }
}
