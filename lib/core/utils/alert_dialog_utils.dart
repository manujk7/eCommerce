import 'package:flutter/cupertino.dart';

import '../../theme/app_style.dart';

class AlertDialogUtil{
  static showAlertDialog(BuildContext context, {required title, required description, positiveAction, negativeAction ,required Function(bool value) userAction}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title,style: AppStyle.txtIBMPlexSansSemiBold16Black900),
        content: Text(description,style: AppStyle.txtIBMPlexSansRegular14Black900),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              userAction(false);
              Navigator.pop(context);
            },
            child: Text(negativeAction,style: AppStyle.txtIBMPlexSansRegular14Black900,),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              userAction(true);
              Navigator.pop(context);
            },
            child: Text(positiveAction,style: AppStyle.txtIBMPlexSansRegular14Black900),
          ),
        ],
      ),
    );
  }
}