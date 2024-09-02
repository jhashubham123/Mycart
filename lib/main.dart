import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycart/app/Providers/favourite_provider.dart';
import 'package:mycart/app/routes/routes.dart';
import 'package:mycart/app/theme/app_colors.dart';
import 'package:mycart/domain/entities/model/hive/favourites/favourite_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteModelAdapter());
  Hive.openBox<FavouriteModel>('favourite');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.generateRoute,
        theme: appTheme,
      ),
    );
  }
}
