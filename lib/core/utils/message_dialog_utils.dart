import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets/custome_dialog_widget.dart';
import '../app_export.dart';

class MessageDialogUtils {
  ///common method for showing success message
  static void showSuccessMessage(
      {String title = '', String subtitle = ''}) async {
    Get.snackbar(
      title,
      subtitle,
      // icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static showMessage({
    String? title,
    String? subtitle,
    Function()? onBtn1Clicked,
  }) async {
    return await showDialog<bool>(
      context: GlobalKeys.navigatorKey.currentState!.context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorConstant.gray100,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0)), //this right here
          child: Container(
            width: 270,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getVerticalSize(title?.length != 0 ? 40 : 0),
                ),
                Text(title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtIBMPlexSansMedium16
                        .copyWith(color: ColorConstant.black900)),
                Container(
                  margin: EdgeInsets.only(
                      left: 16,
                      top: title!.isEmpty ? 0 : getVerticalSize(20.00),
                      right: 16),
                  alignment: Alignment.center,
                  child: Text(subtitle ?? '',
                      style: AppStyle.txtIBMPlexSansRegular14Black900),
                ),
                SizedBox(
                  height: 18,
                ),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: ColorConstant.black900,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 12, bottom: 16),
                    child: Center(
                      child: Text('Okay',
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.txtIBMPlexSansMedium14Black900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showFailMessage({
    String? title,
    String? subtitle,
    Function()? onBtn1Clicked,
  }) async {
    return await showDialog<bool>(
      context: GlobalKeys.navigatorKey.currentState!.context,
      builder: (context) {
        return CustomDialogWidget(
          lottieAssets: 'assets/animation/error.json',
          lottieAnimation: true,
          // singleButton: true,
          // btn1Title: "Ok",
          cancelPass: true,
          btn1Title: 'OK',
          description: subtitle ?? '',
          title: title ?? '',
          onBtn1Clicked: onBtn1Clicked ??
              () {
                Get.back();
              },
        );
      },
    );
  }
}
