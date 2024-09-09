import 'package:flutter/material.dart';
import 'package:mycart/app/routes/routes.dart';
import 'package:mycart/app/screens/navbar/navbar_screen.dart';
import 'package:mycart/app/screens/order/order_screen.dart';
import 'package:mycart/app/screens/product_detail/product_detail_screen.dart';
import 'package:mycart/app/screens/profile/edit_profile.dart';
import 'package:mycart/app/screens/signin/signin_screen.dart';
import 'package:mycart/app/screens/signup/signup_screen.dart';
import 'package:mycart/app/screens/splash/splash_screen.dart';
import 'package:mycart/app/screens/verify/verify_screen.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.signinScreen:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.verifyScreen:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case RouteNames.navbarScreen:
        return MaterialPageRoute(builder: (_) => const AppNavbarScreen());
      case RouteNames.productDetailScreen:
        return MaterialPageRoute(
            builder: (_) => const ProductDetailScreen(), settings: settings);
      case RouteNames.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RouteNames.ordersScreen:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Something Went Wrong'),
      ),
    );
  }
}
