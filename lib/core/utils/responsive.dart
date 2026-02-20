import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  static const double baseWidth = 393;
  static const double baseHeight = 812;

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / baseWidth);
  }

  double height(double value) {
    return MediaQuery.of(context).size.height * (value / baseHeight);
  }
}
