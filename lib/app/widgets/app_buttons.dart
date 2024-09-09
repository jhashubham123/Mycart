import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mycart/app/Providers/favourite_provider.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/domain/entities/model/hive/favourites/favourite_model.dart';
import 'package:provider/provider.dart';

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

  /// Favourite Button
  ///
  static Widget addFavouriteButton(
    context, {
    required int itemId,
    required String itemImage,
    required String itemName,
    required double itemPrice,
  }) {
    return Consumer<FavouriteProvider>(
        builder: (context, favouriteProvider, child) {
      return GestureDetector(
        onTap: () {
          if (favouriteProvider.favouriteBox.containsKey(itemId)) {
            favouriteProvider.deleteFavouriteItem(itemId: itemId);
          } else {
            favouriteProvider.saveFavouriteItem(
              itemId: itemId,
              favouriteModel: FavouriteModel(
                  itemId: itemId,
                  itemImage: itemImage,
                  itemName: itemName,
                  itemPrice: itemPrice.toString()),
            );
          }
        },
        child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor, shape: BoxShape.circle),
              child: Image.asset(
                favouriteProvider.favouriteBox.containsKey(itemId)
                    ? AppImages.redHeartActive
                    : AppImages.redHeart,
                scale: 3,
              ),
            )),
      );
    });
  }

  /// App custom filled button
  static Widget filledButton(
    context, {
    double width = 200,
    required String buttonText,
  }) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          buttonText,
          style: AppTextStyles.white_15_700,
        ),
      ),
    );
  }

  /// App custom outlined button
  static Widget outlinedButton(
    context, {
    double width = 200,
    required String buttonText,
  }) {
    return Container(
      alignment: Alignment.center,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.redColor, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          buttonText,
          style: AppTextStyles.red_15_700,
        ),
      ),
    );
  }
}
