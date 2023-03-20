import 'package:e_commerce_app/presentation/product_category_screen/product_category_screen.dart';
import 'package:e_commerce_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:e_commerce_app/presentation/profile_screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/routes/messaging/fcm_handler.dart';
import '../../core/utils/image_constants_v2.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../home_screen/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final FcmHandler _fcmHandler = Get.find<FcmHandler>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late User currentUser;

  @override
  void initState() {
    if (Get.arguments != null) {
      ProfileController profileController = Get.find();
      profileController.user = Get.arguments;
    }
    _fcmHandler.listenForFcm();
    super.initState();
  }

  @override
  void dispose() {
    _fcmHandler.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const ProductCategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
          backgroundColor: ColorConstant.whiteBg,
          height: getVerticalSize(
            56.00,
          ),
          centerTitle: true,
          title: Text(
            pageTitle(),
            style: AppStyle.txtIBMPlexSansBold24Black900,
          )
          // styleType: Style.bgFillBlack900,
          ),
      backgroundColor: ColorConstant.black900,
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  buildMyNavBar(BuildContext context) {
    return Container(
      height: getVerticalSize(60),
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: getSize(2),
                      width: getSize(46),
                      decoration: BoxDecoration(
                          color: pageIndex == 0
                              ? ColorConstant.black900
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    pageIndex == 0
                        ? CustomImageView(
                            svgPath: ImageConstant.svgHome,
                            height: 20,
                            width: 20,
                            // size: 35,
                          )
                        : CustomImageView(
                            svgPath: ImageConstant.svgHome,
                            height: 20,
                            width: 20,
                            // size: 35,
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home".tr,
                      style: AppStyle.txtIBMPlexSansSemiBold12Black900,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: getSize(2),
                      width: getSize(46),
                      decoration: BoxDecoration(
                          color: pageIndex == 1
                              ? ColorConstant.black900
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    pageIndex == 1
                        ? CustomImageView(
                            svgPath: ImageConstant.svgCategory,
                            height: 20,
                            width: 20,
                            // color: ColorConstant.brandGreen,
                            // size: 35,
                          )
                        : CustomImageView(
                            svgPath: ImageConstant.svgCategory,
                            height: 20,
                            width: 20,
                            // size: 35,
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Category".tr,
                      style: AppStyle.txtIBMPlexSansSemiBold12Black900,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: getSize(2),
                      width: getSize(46),
                      decoration: BoxDecoration(
                          color: pageIndex == 2
                              ? ColorConstant.black900
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    pageIndex == 2
                        ? CustomImageView(
                            svgPath: ImageConstant.svgProfile,
                            height: 20,
                            width: 20,
                            // size: 35,
                          )
                        : CustomImageView(
                            svgPath: ImageConstant.svgProfile,
                            height: 20,
                            width: 20,
                            // size: 35,
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Profile".tr,
                      style: AppStyle.txtIBMPlexSansSemiBold12Black900,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String pageTitle() {
    String title = "";
    if (pageIndex == 0) {
      title = "Home";
    } else if (pageIndex == 1) {
      title = "Category";
    } else if (pageIndex == 2) {
      title = "Profile";
    }

    return title;
  }
}
