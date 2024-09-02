import 'package:flutter/material.dart';
import 'package:mycart/app/routes/routes.dart';
import 'package:mycart/app/theme/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, RouteNames.signinScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          height: size.height,
          width: size.width,
          AppImages.authBackground1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
