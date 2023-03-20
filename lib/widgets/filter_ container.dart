import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class FilterContainer extends StatelessWidget {
  final String? title;
  final EdgeInsets? padding;
  FilterContainer({Key? key, this.title, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16,top: 12,bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: ColorConstant.blueGray50,
          ),
          color: ColorConstant.blueGray50,
          borderRadius: BorderRadius.all(
              Radius.circular(100.0) //                 <--- border radius here
              ),
        ), //             <--- BoxDecoration here
        child: Center(
          child: Container(
            padding: padding,
            child: Text(
              title ?? '',
              style: TextStyle(
                color: ColorConstant.black900,
                fontSize: getFontSize(
                  14,
                ),
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
