import 'package:flutter/material.dart';
import 'package:mycart/app/theme/app_colors.dart';
import 'package:mycart/app/theme/app_images.dart';
import 'package:mycart/app/theme/app_textstyles.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(
          child: userProfile(context),
        ),

        /// User Profile

        SizedBox(
          height: size.height * 0.02,
        ),

        /// Order tile
        settingTile(context,
            iconImage: AppImages.redHeart, tileName: 'Edit Profile'),

        /// Order tile
        settingTile(context, iconImage: AppImages.redHeart, tileName: 'Orders'),

        /// Address tile
        settingTile(context,
            iconImage: AppImages.redHeart, tileName: 'Address'),

        /// Address tile
        settingTile(context,
            iconImage: AppImages.redHeart, tileName: 'Privacy Policy'),

        /// Address tile
        settingTile(context,
            iconImage: AppImages.redHeart, tileName: 'Terms & Condition'),

        /// Log out tile
        settingTile(context, iconImage: AppImages.redHeart, tileName: 'Logout'),
      ],
    ));
  }
}

Widget userProfile(context) {
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'My Account',
            style: AppTextStyles.white_22_700,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: size.height * 0.12,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.lightRedColor, width: 3),
                    color: AppColors.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.lightRedColor, width: 3),
                    shape: BoxShape.circle,
                    color: AppColors.backgroundColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.edit,
                      color: AppColors.redColor,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shubham Jha',
                  style: AppTextStyles.white_20_500,
                ),
                SizedBox(
                  height: size.height * 0.003,
                ),
                Text(
                  '+91-6283712624',
                  style: AppTextStyles.white_14_500,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

/// Setting tile function

Widget settingTile(
  context, {
  required String iconImage,
  required String tileName,
  void Function()? onTap,
}) {
  final size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.backgroundColor)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.backgroundColor,
              child: Image.asset(
                iconImage,
                scale: 2.8,
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              tileName,
              style: AppTextStyles.dark_16_500,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      ),
    ),
  );
}
