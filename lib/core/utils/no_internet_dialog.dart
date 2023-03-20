import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../app_export.dart';
import 'image_constants_v2.dart';

class NoInternetDialogUtils {
  static bool isShown = false;

  ///common method for showing progress dialog
  static void showInternetDialog({required VoidCallback onRetry}) async {
    if (!isShown) {
      isShown = true;
      Get.dialog(
        Material(
          child: Column(
            children: [
              SizedBox(
                height: getSize(550),
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: getSize(550),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(ImageConstant.imageBackground),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstantV2.svgNoInternet,
                          ),
                          SizedBox(
                            height: getSize(120),
                          ),
                          Text(
                            "Your internet has left the chat!",
                            style: AppStyle.txtIBMPlexSansMedium16,
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          Text(
                            "Try connecting to a different internet or wifi",
                            style: AppStyle.txtIBMPlexSansMedium14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              CustomButton(
                height: getSize(52),
                margin: getMarginOrPadding(left: 24, right: 24),
                width: width,
                onTap: () {
                  onRetry();
                  removeDialog();
                },
                text: "Retry",
                shape: ButtonShape.CircleBorder26,
                variant: ButtonVariant.FillBlack900,
                fontStyle: ButtonFontStyle.IBMPlexSansMedium14WhiteA700,
              ),
              SizedBox(height: getSize(28))
            ],
          ),
        ),
        barrierDismissible: false,
      );
    }
  }

  ///common method for hiding progress dialog
  static void removeDialog() {
    if (isShown) {
      isShown = false;
      Get.back();
    }
  }
}
