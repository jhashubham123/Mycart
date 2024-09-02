import 'package:flutter/material.dart';
import 'package:mycart/app/Providers/favourite_provider.dart';
import 'package:mycart/app/theme/app_colors.dart';
import 'package:mycart/app/theme/app_images.dart';
import 'package:mycart/app/theme/app_textstyles.dart';
import 'package:mycart/app/widgets/app_textfield.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';
import 'package:mycart/app/widgets/custom_widgets.dart';
import 'package:mycart/app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Custom App bar
          homeCustomAppBar(context),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Special for you
                  specialForYou(context,
                      currentPage: currentPage,
                      pageController: _pageController),

                  /// Category section
                  categories(context),

                  /// Popular Products
                  popularProducts(context),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

Widget homeCustomAppBar(context) {
  final size = MediaQuery.of(context).size;
  return CustomAppBar(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: AppTextStyles.white_13_500,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.locationIcon,
                        scale: 3,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'New York, USA',
                        style: AppTextStyles.white_15_700,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ],
              ),

              /// Notification icon
              AppCustomWidgets.customIconBox(
                backgroundColor: AppColors.lightRedColor.withOpacity(0.4),
                image: AppImages.notificationIcon,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            children: [
              /// Search field
              Expanded(
                child: AppTextfield.appSearchTextfield(
                    prefixIcon: Image.asset(
                      AppImages.searchIcon,
                      scale: 1.2,
                    ),
                    hintText: 'Search'),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),

              /// Setting Icon
              AppCustomWidgets.customIconBox(
                backgroundColor: AppColors.whiteColor,
                image: AppImages.settingIcon,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

/// # Special for you
Widget specialForYou(context,
    {required int currentPage, required PageController pageController}) {
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#SpecialForYou',
              style: AppTextStyles.dark_20_600,
            ),
            Text(
              'See All',
              style: AppTextStyles.red_14_500,
            ),
          ],
        ),
      ),
      SizedBox(
        height: size.height * 0.23,
        width: size.width,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(207, 207, 207, 1),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 3.0, //extend the shadow
                    )
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
      ),

      /// Special for you pageview tracker
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 12,
            width: currentPage == index ? size.width * 0.05 : size.width * 0.03,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: currentPage == index
                  ? AppColors.redColor
                  : AppColors.backgroundColor,
            ),
          );
        }),
      )
    ],
  );
}

/// Category Section
Widget categories(context) {
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
              style: AppTextStyles.dark_20_600,
            ),
            Text(
              'See All',
              style: AppTextStyles.red_14_500,
            ),
          ],
        ),
      ),

      /// Catgory List
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: size.height * 0.12,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: size.width * 0.20,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Carry Bags',
                    style: AppTextStyles.dark_14_600,
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: size.width * 0.033,
              );
            },
          ),
        ),
      )
    ],
  );
}

/// Popular products
Widget popularProducts(context) {
  final size = MediaQuery.of(context).size;
  return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Products',
                style: AppTextStyles.dark_20_600,
              ),
              Text(
                'See All',
                style: AppTextStyles.red_14_500,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),

          /// Popular Products List
          const ProductCard(
            itemCount: 6,
          )
        ],
      ),
    );
  });
}
