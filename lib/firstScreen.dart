import 'package:flpapp/ColorResources.dart';
import 'package:flpapp/loginPage.dart';
import 'package:flpapp/readMorePage.dart';
import 'package:flpapp/signupPage.dart';
import 'package:flpapp/strings.dart';
import 'package:flutter/material.dart';

import 'Images.dart';
// ignore: unused_import
import 'Utils.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 150,
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 150,
                child: Text(
                  "SignUp",
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
        toolbarHeight: 100,
        title: Container(
          margin: EdgeInsets.all(80),
          alignment: Alignment.centerLeft,
          child: Text(
            "Leebras Wealth",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Image.asset(
                Images.banner,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: 700,
              alignment: Alignment.topLeft,
              child: Column(
                children: rightSideWidget(),
              ),
            ),
          ]),
          SizedBox(
            height: 120,
          ),
          Row(children: innerSection()),
          SizedBox(height: 80),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
            height: 900,
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Developed For Higher \nBusiness Growth",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                          width: 710,
                          child: section(
                              Images.line1, "Title 1", Descriptions.title1)),
                      SizedBox(
                        height: 50,
                      ),
                      section(Images.line1, "Title 2", Descriptions.title2),
                      SizedBox(
                        height: 50,
                      ),
                    ]),
                Image.asset(Images.design)
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 800,
                width: 1500,
                child: Column(
                  children: [
                    Image.asset(Images.arrow),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Our \nWorkflow",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: [
                          board(Images.strategy, "Strategy",
                              EdgeInsets.only(left: 430)),
                          SizedBox(
                            width: 60,
                          ),
                          board(Images.rocket, "", EdgeInsets.zero),
                          SizedBox(
                            width: 50,
                          ),
                          board(Images.research, "Research", EdgeInsets.zero)
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 250,
                      child: Row(
                        children: [
                          board(Images.planning, "Planning",
                              EdgeInsets.only(left: 220)),
                          SizedBox(
                            width: 220,
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 400,
                              width: 300,
                              child: board(Images.optimization, "Optimization",
                                  EdgeInsets.zero)),
                          SizedBox(
                            width: 140,
                          ),
                          Container(
                              height: 400,
                              width: 200,
                              child: board(
                                  Images.result, "Results", EdgeInsets.zero))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Provide Awesome Service \nWith Our Tools",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Row(
                      children: [
                        lastPanel(Images.proj, "Project 1",
                            "Aenean vulputate eleifend tellus. \nAenean leo ligula,npor consequat \nvulputate eleifend")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Row(
                      children: [
                        lastPanel(Images.proj2, "Project 2",
                            "Aenean vulputate eleifend tellus. \nAenean leo ligula,npor consequat \nvulputate eleifend")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Row(
                      children: [
                        lastPanel(Images.proj3, "Project 3",
                            "Aenean vulputate eleifend tellus. \nAenean leo ligula,npor consequat \nvulputate eleifend")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Widget> innerSection() {
    Size size = MediaQuery.of(context).size;
    return [
      Container(
        alignment: Alignment.center,
        height: 250,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorResources.buttonOrange,
                  ColorResources.buttonDarkOrange,
                ]),
            color: ColorResources.buttonOrange,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(125),
                bottomRight: Radius.circular(125))),
        child: Row(
          children: [
            gridContainer("", ""),
            gridContainer("99+", "Active Members"),
            Container(
              width: 1,
              height: 150,
              color: ColorResources.white,
            ),
            gridContainer("1100+", "Frequent Clients"),
            Container(
              width: 1,
              height: 150,
              color: ColorResources.white,
            ),
            gridContainer("20+", "Team Advisors"),
            Container(
              width: 1,
              height: 150,
              color: ColorResources.white,
            ),
            gridContainer("15+", "Glorious Years"),
          ],
        ),
      ),
    ];
  }

  Widget gridContainer(String text1, String text2) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
                color: ColorResources.white,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          Text(text2,
              style: TextStyle(color: ColorResources.white, fontSize: 25)),
        ],
      ),
    );
  }

  List<Widget> rightSideWidget() {
    return [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          Descriptions.title,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        child: Text(
          Descriptions.aboutUs,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.only(right: 150),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReadMore()),
            );
          },
          //GET STARTED BUTTON
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
            height: 70,
            width: 200,
            child: Text(
              "Read More",
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
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
    ];
  }

  Widget section(String imageName, String title, String description) {
    return Row(children: [
      Image.asset(imageName),
      SizedBox(width: 30),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      )
    ]);
  }

  Widget board(
    String imageName,
    String caption,
    EdgeInsets position,
  ) {
    return Container(
      alignment: Alignment.topLeft,
      margin: position,
      child: Column(
        children: [
          Image.asset(imageName, height: 200),
          Text(
            caption,
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  Widget lastPanel(
    String imageName,
    String title,
    String description,
  ) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
