import 'package:flutter/material.dart';
import 'package:mycart/app/screens/cart/cart_screen.dart';
import 'package:mycart/app/screens/category/category_screen.dart';
import 'package:mycart/app/screens/home/home_screen.dart';
import 'package:mycart/app/screens/profile/profile_screen.dart';
import 'package:mycart/app/screens/wishlist/wishlist_screen.dart';
import 'package:mycart/app/theme/theme.dart';

class AppNavbarScreen extends StatefulWidget {
  const AppNavbarScreen({super.key});

  @override
  State<AppNavbarScreen> createState() => _AppNavbarScreenState();
}

class _AppNavbarScreenState extends State<AppNavbarScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.inputBoxBackgroundColor,
                spreadRadius: 5,
                blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.redColor,
          selectedLabelStyle: AppTextStyles.red_12_500,
          unselectedLabelStyle: AppTextStyles.grey_12_500,
          unselectedItemColor: AppColors.greyIconColor,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                selectedIndex == 0
                    ? AppImages.homeActiveIcon
                    : AppImages.homeIcon,
                scale: 2.2,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  selectedIndex == 1
                      ? AppImages.categoriesActiveIcon
                      : AppImages.categoriesIcon,
                  scale: 2.2,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  selectedIndex == 2
                      ? AppImages.cartActiveIcon
                      : AppImages.cartIcon,
                  scale: 2.2,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  selectedIndex == 3
                      ? AppImages.wishlistActiveIcon
                      : AppImages.wishlistIcon,
                  scale: 2.2,
                ),
                label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  selectedIndex == 4
                      ? AppImages.profileActiveIcon
                      : AppImages.profileIcon,
                  scale: 2.2,
                ),
                label: 'Profile'),
          ],
        ),
      ),
      body: screens.elementAt(selectedIndex),
    );
  }
}
