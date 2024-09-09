import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';

class AppCustomWidgets {
  /// Custom icon box including icon in a container
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

  /// Star icon for rating and reviews
  static Widget starIcon({
    bool needRatingText = false,
    String ratingText = '',
  }) {
    return Row(
      children: [
        const Icon(
          Icons.star_rate_rounded,
          size: 20,
          color: AppColors.starColor,
        ),
        needRatingText
            ? Text(
                ratingText,
                style: AppTextStyles.grey_14_500,
              )
            : const SizedBox(),
      ],
    );
  }
}
