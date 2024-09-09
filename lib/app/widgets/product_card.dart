import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mycart/app/Providers/favourite_provider.dart';
import 'package:mycart/app/routes/route_names.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/app_buttons.dart';
import 'package:mycart/app/widgets/custom_widgets.dart';
import 'package:mycart/domain/entities/model/hive/favourites/favourite_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final dynamic productItem;
  final double childAspectRatio;

  const ProductCard({
    super.key,
    required this.productItem,
    this.childAspectRatio = 2 / 2.7,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FavouriteProvider>(
        builder: (context, favouriteProvider, child) {
      return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: productItem.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.productDetailScreen,
                    arguments: {
                      'itemId': productItem[index].itemId,
                      'itemImage': productItem[index].itemImage,
                      'itemName': productItem[index].itemName,
                      'itemPrice': productItem[index].itemPrice,
                    });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Image
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: size.height * 0.20,
                        width: size.width / 1.5,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network(productItem[index].itemImage),
                      ),

                      /// Favourite Button
                      AppButton.addFavouriteButton(
                        context,
                        itemId: productItem[index].itemId,
                        itemImage: productItem[index].itemImage,
                        itemName: productItem[index].itemName,
                        itemPrice: productItem[index].itemPrice,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  /// Product name and rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${productItem[index].itemName}',
                          style: AppTextStyles.dark_14_500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      AppCustomWidgets.starIcon(
                        needRatingText: true,
                        ratingText: '4.5',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.003,
                  ),

                  /// Product price
                  Text(
                    '₹${productItem[index].itemPrice}',
                    style: AppTextStyles.dark_16_700,
                  ),
                ],
              ),
            );
          });
    });
  }
}
