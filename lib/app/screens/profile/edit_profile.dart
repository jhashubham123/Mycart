import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/app_buttons.dart';
import 'package:mycart/app/widgets/app_textfield.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          /// Edit profile app bar
          const CustomAppBar(
            needBorderRadius: false,
            bottomPadding: 20,
            needBackButton: true,
            title: 'Edit Profile',
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /// First name field
                AppTextfield.appInputField(lableText: 'First Name'),

                /// Last name field
                AppTextfield.appInputField(lableText: 'Last Name'),
                SizedBox(
                  height: size.height * 0.05,
                ),

                /// Submit button
                AppButton.filledButton(context,
                    buttonText: 'Submit', width: size.width),
                SizedBox(
                  height: size.height * 0.02,
                ),

                AppButton.outlinedButton(context,
                    buttonText: 'Deactivate Account', width: size.width),
                SizedBox(
                  height: size.height * 0.02,
                ),
                AppButton.filledButton(context,
                    buttonText: 'Delete Account', width: size.width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
