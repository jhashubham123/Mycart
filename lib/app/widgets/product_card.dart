import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final int itemCount;
  final double childAspectRatio;

  const ProductCard({
    super.key,
    required this.itemCount,
    this.childAspectRatio = 2 / 2.7,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Image
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: size.height * 0.20,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, right: 15),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          AppImages.redHeart,
                          scale: 3,
                        ),
                      )),
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
                      'Nike pegasus 39',
                      style: AppTextStyles.dark_14_500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 20,
                  ),
                  Text(
                    '4.5',
                    style: AppTextStyles.grey_14_500,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.003,
              ),

              /// Product price
              Text(
                '₹90',
                style: AppTextStyles.dark_16_700,
              ),
            ],
          );
        });
  }
}
