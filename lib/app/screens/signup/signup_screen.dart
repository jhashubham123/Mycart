import 'package:flutter/material.dart';
import 'package:mycart/app/routes/routes.dart';
import 'package:mycart/app/theme/app_colors.dart';
import 'package:mycart/app/theme/app_images.dart';
import 'package:mycart/app/theme/app_textstyles.dart';
import 'package:mycart/app/widgets/app_buttons.dart';
import 'package:mycart/app/widgets/app_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Image
              Image.asset(
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
                AppImages.authBackground1,
              ),

              /// Sign in content
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Sign up',
                                style: AppTextStyles.bigHeading,
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),

                              /// Name text field
                              AppTextfield.appInputField(
                                lableText: 'Full name',
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              /// Mobile Number text field
                              AppTextfield.appInputField(
                                lableText: 'Mobile Number',
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              /// Gmail text field
                              AppTextfield.appInputField(
                                lableText: 'Gmail',
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              /// Password text field
                              AppTextfield.appInputField(
                                lableText: 'password',
                                textInputAction: TextInputAction.done,
                                suffixIcon: const Icon(
                                  Icons.visibility,
                                  color: AppColors.greyIconColor,
                                ),
                              ),

                              SizedBox(
                                height: size.height * 0.05,
                              ),

                              /// Forgot password  and sign up Text button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: AppTextStyles.red_16_500,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, RouteNames.signinScreen);
                                    },
                                    child: Text(
                                      ' Sign in',
                                      style: AppTextStyles.dark_16_500,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Go forward button

                  Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: AppButton.circleGradientButton(
                        height: 70,
                        width: 70,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.verifyScreen);
                        },
                        child: Image.asset(
                          color: AppColors.whiteColor,
                          AppImages.rightArrow,
                          scale: 17,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
