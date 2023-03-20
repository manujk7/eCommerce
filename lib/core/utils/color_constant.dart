import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray50 = fromHex('#f1f1f1');

  static Color deepPurple400 = fromHex('#8d4cd8');

  static Color indigoA200 = fromHex('#6867ef');

  static Color deepPurple600 = fromHex('#6724b2');

  static Color teal100 = fromHex('#beecdc');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color teal300 = fromHex('#63cca7');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color teal600 = fromHex('#1e9568');

  static Color amberA700 = fromHex('#e9ae08');

  static Color black900 = fromHex('#030a21');

  static Color green900 = fromHex('#056A67');

  static Color teal800 = fromHex('#0a754d');

  static Color deepOrange900 = fromHex('#aa5009');

  static Color teal900 = fromHex('#0a4731');

  static Color yellow900 = fromHex('#df7d2f');

  static Color pink600 = fromHex('#cb326b');

  static Color pink300 = fromHex('#e15893');

  static Color orangeA200 = fromHex('#eda24c');

  static Color indigo50 = fromHex('#d6d9fb');

  static Color gray900 = fromHex('#411e03');

  static Color amber300 = fromHex('#f6c94b');

  static Color teal50 = fromHex('#cef0e7');

  static Color gray300 = fromHex('#dddddd');

  static Color deepPurple50 = fromHex('#e9d7fc');

  static Color orange50 = fromHex('#fcebd4');

  static Color indigoA400 = fromHex('#5554ed');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo500 = fromHex('#4646b1');

  static Color gray902 = fromHex('#181e30');

  static Color deepPurple5001 = fromHex('#e9d7fc');

  static Color gray400 = fromHex('#c4c4c4');

  static Color black9003d = fromHex('#3d000000');

  static Color black90020 = fromHex('#35000000');

  static Color black9001e = fromHex('#1e000000');

  static Color yellow100 = fromHex('#fcefc7');

  static Color blueGray700 = fromHex('#4b5060');

  static Color greenA40000 = fromHex('#0037ed81');

  static Color greenA400 = fromHex('#37ed81');
  static Color gray100 = fromHex('#f6f6f6');
  static Color bluegray800 = fromHex('#313a52');
  static Color blue800 = fromHex('#2f75b8');
  static Color redError = fromHex("#c60100");
  static Color blue400 = fromHex('#4299e1');
  static Color brandGreen = fromHex('#056A67');
  static Color darkGrey = fromHex('#e2e4e9');
  static Color whiteBg = fromHex('#fcfcfc');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
