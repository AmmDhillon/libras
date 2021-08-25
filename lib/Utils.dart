import 'package:flutter/cupertino.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (width > height) {
      return false;
    } else {
      return true;
    }
  }

  static bool isNumeric(String input) {
    String source = input.trim();
    try {
      int.tryParse(source) ?? double.tryParse(source);
      return true;
    } catch (e) {
      return false;
    }
  }

  static double adjustWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;

    if (isMobile(context)) {
      return width;
    } else {
      return width / 2.5;
    }
  }
}
