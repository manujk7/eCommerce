import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app_export.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      isProgressVisible = true;
      Get.dialog(
        Container(
          height: size.height,
          width: size.width,
          color: Colors.transparent,
          child: Center(
            child: Container(
              // height: 150,
              // width: 150,
              child: Lottie.asset('assets/animations/loader.json'),
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) {
      isProgressVisible = false;
      Get.back();
    }
  }

  static Future<void> withLoader(Future Function() action) async {
    showProgressDialog(isCancellable: false);
    await action();
    hideProgressDialog();
  }
}
