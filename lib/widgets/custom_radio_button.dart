// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.fontStyle,
      this.margin,
      this.onChange,
      this.value,
      this.groupValue,
      this.text});

  RadioFontStyle? fontStyle;

  EdgeInsetsGeometry? margin;

  Function(String)? onChange;

  String? value;

  String? groupValue;

  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onChange!(value!);
        },
        child: Row(
          children: [
            Radio<String>(
              value: value ?? "",
              groupValue: groupValue,
              onChanged: (value) {
                onChange!(value!);
              },
            ),
            Padding(
              padding: getPadding(
                left: 10,
              ),
              child: Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: _setFontStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum RadioFontStyle {
  IBMPlexSansSemiBold16,
}
