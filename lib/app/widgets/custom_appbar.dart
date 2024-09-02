import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final bool needBorderRadius;
  final double bottomPadding;
  final double topPadding;
  const CustomAppBar({
    super.key,
    required this.child,
    this.needBorderRadius = true,
    this.bottomPadding = 30,
    this.topPadding = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
      decoration: BoxDecoration(
          borderRadius: needBorderRadius
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))
              : BorderRadius.circular(0),
          image: const DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              image: AssetImage(AppImages.authBackground3))),
      child: child,
    );
  }
}
