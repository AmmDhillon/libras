import 'package:flpapp/ColorResources.dart';
import 'package:flpapp/Images.dart';
import 'package:flpapp/strings.dart';
import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  const ReadMore({Key? key}) : super(key: key);

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        title: Text(
          "About Us",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      height: 250,
                      child: Image.asset(
                        Images.book,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 600,
                    width: 1100,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.buttonDarkOrange, width: 7),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text(
                        Descriptions.wholeAboutUs,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
