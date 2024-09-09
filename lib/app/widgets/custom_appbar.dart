import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final bool customChild;
  final Widget? child;
  final Widget? action;
  final bool needBorderRadius;
  final double bottomPadding;
  final double topPadding;
  final bool needBackButton;
  final String title;
  const CustomAppBar({
    this.child,
    super.key,
    this.action,
    this.needBorderRadius = true,
    this.bottomPadding = 30,
    this.topPadding = 60,
    this.needBackButton = false,
    this.customChild = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      child: customChild
          ? child
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Back button if needBackButton will be true
                  needBackButton
                      ? InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: needBackButton ? size.width * 0.02 : 0,
                  ),
                  Text(
                    title,
                    style: AppTextStyles.white_22_700,
                  ),
                  const Spacer(),

                  action ?? const SizedBox(),
                ],
              ),
            ),
    );
  }
}
