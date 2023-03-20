import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final String? svgIconPath;
  final String lottieAsstesUrl;
  final String? lottieAssets;
  final String? btn1Title;
  final String? btn2Title;
  final bool lottieAnimation;
  final bool? cancelPass;
  final bool? singleButton;
  final Function()? onBtn1Clicked;
  final Function()? onBtn2Clicked;
  final bool? isRow;
  final Color? onBtn1PrimaryColor;

  const CustomDialogWidget({
    Key? key,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
    this.svgIconPath,
    this.lottieAssets,
    this.lottieAsstesUrl = '',
    this.lottieAnimation = false,
    this.cancelPass = false,
    this.singleButton = false,
    this.onBtn1Clicked,
    this.onBtn2Clicked,
    this.btn1Title,
    this.btn2Title,
    this.isRow = false,
    this.onBtn1PrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConstant.gray100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: getMargin(top: 55),
                width: getSize(74.00),
                height: getSize(74.00),
                child: lottieAnimation
                    ? lottieAsstesUrl.length == 0
                        ? Lottie.asset(lottieAssets ?? '')
                        : Lottie.network(lottieAsstesUrl)
                    : SvgPicture.asset(
                        svgIconPath ?? ImageConstant.imgCheckmark,
                        fit: BoxFit.fill,
                      )),
            SizedBox(
              height: getVerticalSize(title.length != 0 ? 40 : 0),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: titleStyle ??
                  TextStyle(
                    color: ColorConstant.bluegray800,
                    fontSize: getFontSize(
                      18,
                    ),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 1.44,
                  ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: getHorizontalSize(49.00),
                top: title.length == 0 ? 0 : getVerticalSize(20.00),
                right: getHorizontalSize(48.00),
                bottom: getVerticalSize(30.00),
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: descriptionStyle ??
                    TextStyle(
                      color: ColorConstant.black900,
                      fontSize: getFontSize(
                        16,
                      ),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
              ),
            ),
            isRow == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (singleButton!)
                        singleButtonPress(context, btn2Title, onBtn2Clicked),
                      if (cancelPass!)
                        cancelButtonPass(context, btn1Title, onBtn1Clicked,
                            onBtn1PrimaryColor),
                    ],
                  )
                : Column(
                    children: [
                      if (singleButton!)
                        singleButtonPress(context, btn2Title, onBtn2Clicked),
                      if (cancelPass!)
                        cancelButtonPass(context, btn1Title, onBtn1Clicked,
                            onBtn1PrimaryColor),
                    ],
                  ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

singleButtonPress(
    BuildContext context, String? btn2Title, Function()? onBtn2Clicked) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: onBtn2Clicked,
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: ColorConstant.blue800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          btn2Title ?? 'Ok',
          style: TextStyle(
            color: ColorConstant.whiteA700,
            fontSize: getFontSize(
              16,
            ),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.20,
          ),
        ),
      ),
    ),
  );
}

cancelButtonPass(BuildContext context, String? btn1Title,
    Function()? onBtn1Clicked, Color? onBtn1PrimaryColor) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: onBtn1Clicked,
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: onBtn1PrimaryColor ?? ColorConstant.redError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          btn1Title ?? "Ok",
          style: TextStyle(
            color: ColorConstant.whiteA700,
            fontSize: getFontSize(
              16,
            ),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.20,
          ),
        ),
      ),
    ),
  );
}
