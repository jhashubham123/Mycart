import 'package:flutter/material.dart';
import 'package:mycart/app/screens/home/home_screen.dart';
import 'package:mycart/app/theme/app_colors.dart';
import 'package:mycart/app/theme/app_images.dart';
import 'package:mycart/app/theme/app_textstyles.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';
import 'package:mycart/app/widgets/product_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int preIndex = 0;
  int currentIndex = 0;
  int postIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          /// Categories app bar
          CustomAppBar(
            needBorderRadius: false,
            bottomPadding: 20,
            title: 'Categories',
            action: Image.asset(
              AppImages.searchIcon,
              color: AppColors.whiteColor,
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 87,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                preIndex = currentIndex - 1;
                                postIndex = currentIndex + 1;
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 5, 10),
                                  decoration: BoxDecoration(
                                    border: index != 0
                                        ? const Border(
                                            top: BorderSide(
                                                color: AppColors.greyScaffold,
                                                width: 2))
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Image.network(
                                              'http://picsum.photos/100?random=$index'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Category Name',
                                        style: AppTextStyles.dark_12_500,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),

                                /// Selected bar
                                Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      width: currentIndex == index ? 6 : 0,
                                      decoration: const BoxDecoration(
                                          color: AppColors.redColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 5, right: 5),
                  child: ProductCard(
                    productItem: data,
                    childAspectRatio: 1 / 1.7,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
