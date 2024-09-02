import 'package:flutter/material.dart';
import 'package:mycart/app/routes/routes.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/app_buttons.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.keyboard_backspace,
                  size: 45,
                  color: AppColors.whiteColor,
                )),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Image
            Image.asset(
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
              AppImages.authBackground1,
            ),

            /// Verify OTP content
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(top: 30),
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Enter OTP',
                              style: AppTextStyles.bigHeading,
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Verification',
                                style: AppTextStyles.dark_20_500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Enter the OTP sent to your mobile number',
                                  style: AppTextStyles.dark_14_500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '+91 XXXXXXXXXX',
                                    style: AppTextStyles.red_16_700,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  const Icon(
                                    Icons.edit,
                                    color: AppColors.redColor,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),

                            /// OTP field
                            Center(
                              child: Pinput(
                                defaultPinTheme: defaultPinTheme,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /// Go forward button

                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: AppButton.circleGradientButton(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteNames.navbarScreen,
                            (Route<dynamic> route) => false);
                      },
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        color: AppColors.whiteColor,
                        AppImages.rightArrow,
                        scale: 17,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  height: 65,
  width: 60,
  decoration: BoxDecoration(
    color: AppColors.inputBoxBackgroundColor,
    borderRadius: BorderRadius.circular(20),
  ),
  textStyle: AppTextStyles.dark_20_700,
);
