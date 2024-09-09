import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/app_buttons.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';
import 'package:mycart/app/widgets/custom_widgets.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productDetails = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      body: Column(
        children: [
          /// Categories app bar
          const CustomAppBar(
            needBorderRadius: false,
            bottomPadding: 20,
            needBackButton: true,
            title: 'Product Details',
          ),

          /// Product Images
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      /// Product Images here
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: AppColors.backgroundColor,
                        height: size.height / 2.5,
                        width: size.width,
                        child: Image.network(productDetails['itemImage']),
                      ),

                      /// Favourite Button
                      Positioned(
                        right: 10,
                        top: 10,
                        child: AppButton.addFavouriteButton(
                          context,
                          itemId: productDetails['itemId'],
                          itemImage: productDetails['itemImage'],
                          itemName: productDetails['itemName'],
                          itemPrice: productDetails['itemPrice'],
                        ),
                      ),
                    ],
                  ),

                  /// Product category and rating
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Carrybags',
                              style: AppTextStyles.grey_14_500,
                            ),
                            AppCustomWidgets.starIcon(
                                needRatingText: true, ratingText: '3.0'),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),

                        /// Product Name
                        Text(
                          productDetails['itemName'],
                          style: AppTextStyles.dark_17_600,
                        ),

                        /// Product description
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Product Details',
                          style: AppTextStyles.dark_16_500,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ReadMoreText(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          style: AppTextStyles.grey_14_500,
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          moreStyle: AppTextStyles.redUnderline_14_500,
                          lessStyle: AppTextStyles.redUnderline_14_500,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
