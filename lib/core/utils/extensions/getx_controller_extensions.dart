import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/message_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/no_internet_dialog.dart';
import 'package:e_commerce_app/core/utils/progress_dialog_utils.dart';

extension NetworkCall on GetxController {
  void networkCallHelper<T>({
    required Future Function() fetchCall,
    required Function(T value) onData,
    Function(Object)? onError,
  }) async {
    ProgressDialogUtils.showProgressDialog();

    try {
      onData(await fetchCall());
      ProgressDialogUtils.hideProgressDialog();
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();

      if (onError != null)
        onError.call(ex);
      else {
        if (ex is NoInternetException) {
          NoInternetDialogUtils.showInternetDialog(onRetry: () {
            networkCallHelper(fetchCall: fetchCall, onData: onData);
          });
        } else {
          MessageDialogUtils.showFailMessage(subtitle: ex.toString());
        }
      }
    }
  }

  void networkCallHelperWithoutLoader<T>({
    required Future fetchCall,
    required Function(T value) onData,
    Function(Object)? onError,
  }) async {
    try {
      onData(await fetchCall);
    } catch (ex) {
      onError!(ex);
    }
  }

  Future<T?> asyncCallWithLoader<T>({
    required Future fetchCall,
  }) async {
    T? result;
    ProgressDialogUtils.showProgressDialog();

    try {
      result = await fetchCall;
      ProgressDialogUtils.hideProgressDialog();
    } catch (ex, stack) {
      Logger.log("Error while fetching data - $ex", stackTrace: stack);
      ProgressDialogUtils.hideProgressDialog();
      if (ex is NoInternetException) {
        NoInternetDialogUtils.showInternetDialog(onRetry: () {});
      } else {
        MessageDialogUtils.showFailMessage(subtitle: ex.toString());
      }
    }
    return result;
  }
}
