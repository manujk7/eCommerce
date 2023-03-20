import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/image_constants_v2.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black900,
      body: Container(
        color: Colors.white,
        height: Get.height,
        child: CustomImageView(
          fit: BoxFit.fill,
          imagePath: ImageConstantV2.pngSplashImage,
        ),
      ),
    );
  }
}
