import 'package:e_commerce_app/presentation/bottom_nav_bar_screen/binding/bottom_nav_bar_binding.dart';
import 'package:e_commerce_app/presentation/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:e_commerce_app/presentation/login/login_screen.dart';
import 'package:e_commerce_app/presentation/product_view_by_category/binding/product_view_by_category_binding.dart';
import 'package:e_commerce_app/presentation/register_screen/register_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../presentation/product_detail_screen/binding/product_detail_binding.dart';
import '../presentation/product_detail_screen/product_detail_screen.dart';
import '../presentation/product_view_by_category/product_view_by_category_screen.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';
  static const String productByCategoryScreen = '/productByCategoryScreen';
  static const String productScreen = '/productScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const BottomNavBarScreen(),
      bindings: [
        BottomNavBarBinding(),
      ],
    ),
    GetPage(
      name: productByCategoryScreen,
      page: () => const ProductViewByCategoryScreen(),
      bindings: [
        ProductViewByCategoryBinding(),
      ],
    ),
    GetPage(
      name: productScreen,
      page: () => const ProductDetailScreen(),
      bindings: [
        ProductDetailBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
    ),
  ];
}
