import 'package:flutter/material.dart';

class AppCustomWidgets {
  static Widget customIconBox({
    required Color backgroundColor,
    required String image,
    double allPadding = 10,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(allPadding),
        child: Image.asset(
          image,
          scale: 2.5,
        ),
      ),
    );
  }
}
