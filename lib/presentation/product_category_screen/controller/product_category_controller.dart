import 'dart:convert';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/message_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/progress_dialog_utils.dart';
import 'package:e_commerce_app/domain/data_service.dart';

class ProductCategoryController extends GetxController {
  final DataService _dataService = Get.find<DataService>();
  RxList<String> categoryList = RxList();

  @override
  Future<void> onReady() async {
    super.onReady();
    ProgressDialogUtils.showProgressDialog();
    try {
      await Future.wait([
        getCategoryList(),
      ]);
      ProgressDialogUtils.hideProgressDialog();
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      MessageDialogUtils.showFailMessage(subtitle: ex.toString());
    }
  }

  Future getCategoryList() async {
    try {
      var newString = "";
      var response = await _dataService.fetchStringFromNetwork(
          Method.GET, "/products/categories",
          mapper: (data) => newString = data);
      if (response != null) {
        categoryList.value = json.decode(response).cast<String>().toList();
      }
    } catch (ex) {
      Logger.log(ex);
    }
  }
}
