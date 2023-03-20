import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Container(
      // color: Colors.blueAccent,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: TextButton(
          onPressed: onTap,
          style: _buildTextButtonStyle(),
          child: _buildButtonWithOrWithoutIcon(),
        ),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        getHorizontalSize(width ?? 0),
        getVerticalSize(height ?? 0),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT10:
        return getPadding(
          top: 10,
          right: 10,
          bottom: 10,
        );
      case ButtonPadding.PaddingT11:
        return getPadding(
          top: 11,
          right: 11,
          bottom: 11,
        );
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      default:
        return getPadding(
          top: 3,
          right: 3,
          bottom: 3,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillBluegray50:
        return ColorConstant.blueGray50;
      case ButtonVariant.OutlineDeeppurple50:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack9001e:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack9001e_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBlack900:
        return ColorConstant.black900;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineDeeppurple50:
        return BorderSide(
          color: ColorConstant.deepPurple50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlack9001e:
      case ButtonVariant.OutlineBlack9001e_1:
      case ButtonVariant.FillBlack900:
        return null;
      default:
        return BorderSide(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9001e:
        return ColorConstant.black9001e;
      case ButtonVariant.OutlineBlack9001e_1:
        return ColorConstant.black9001e;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case ButtonShape.CircleBorder21:
        return BorderRadius.circular(
          getHorizontalSize(
            21.00,
          ),
        );
      case ButtonShape.CircleBorder17:
        return BorderRadius.circular(
          getHorizontalSize(
            17.00,
          ),
        );
      case ButtonShape.CircleBorder26:
        return BorderRadius.circular(
          getHorizontalSize(
            26.00,
          ),
        );
      case ButtonShape.RoundedBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.IBMPlexSansMedium14:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.IBMPlexSansSemiBold1291:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12.91,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.IBMPlexSansMedium1211:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12.11,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.IBMPlexSansMedium1017:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            10.17,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.IBMPlexSansMedium1633:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16.33,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.IBMPlexSansMedium14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
        case ButtonFontStyle.IBMPlexSansMedium14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'IBM Plex Sans',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder12,
  CircleBorder20,
  CircleBorder26,
  CircleBorder21,
  CircleBorder17,
  RoundedBorder14,
}

enum ButtonPadding {
  PaddingT3,
  PaddingT10,
  PaddingT16,
  PaddingT11,
  PaddingAll8,
  PaddingAll15,
}

enum ButtonVariant {
  FillWhiteA700,
  FillBluegray50,
  OutlineBlack900,
  OutlineDeeppurple50,
  OutlineBlack9001e,
  OutlineBlack9001e_1,
  FillBlack900,
}

enum ButtonFontStyle {
  IBMPlexSansRegular12,
  IBMPlexSansMedium14,
  IBMPlexSansSemiBold1291,
  IBMPlexSansMedium1211,
  IBMPlexSansMedium1017,
  IBMPlexSansMedium1633,
  IBMPlexSansMedium14WhiteA700,
  IBMPlexSansMedium14Black900,
}
