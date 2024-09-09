import 'package:flutter/material.dart';
import 'package:mycart/app/Providers/favourite_provider.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';
import 'package:mycart/app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Categories app bar
          CustomAppBar(
            needBorderRadius: false,
            bottomPadding: 20,
            title: 'Favourites',
            action: Image.asset(
              AppImages.searchIcon,
              color: AppColors.whiteColor,
            ),
          ),

          /// Favourites List
          Consumer<FavouriteProvider>(
              builder: (context, favouriteProvider, child) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ProductCard(
                  productItem: favouriteProvider.favouriteBox.values.toList(),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
