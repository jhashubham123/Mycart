import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mycart/app/theme/app_colors.dart';

class AppButton {
  static Widget circleGradientButton(
      {required double height,
      required double width,
      required Widget child,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffFF5F5F),
                AppColors.redColor,
              ],
            )),
        child: child,
      ),
    );
  }
}
