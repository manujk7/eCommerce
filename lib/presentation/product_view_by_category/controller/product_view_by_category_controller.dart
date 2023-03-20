import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/message_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/progress_dialog_utils.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import '../../home_screen/models/product_list_model.dart';

class ProductViewByCategoryController extends GetxController {
  final DataService _dataService = Get.find<DataService>();
  Rx<ProductListModel> productList = ProductListModel().obs;
  RxString category = "".obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    if (Get.arguments != null) {
      category.value = Get.arguments;
    }

    ProgressDialogUtils.showProgressDialog();
    try {
      await Future.wait([
        getProductList(),
      ]);
      ProgressDialogUtils.hideProgressDialog();
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      MessageDialogUtils.showFailMessage(subtitle: ex.toString());
    }
  }

  Future getProductList() async {
    try {
      ProductListModel? response =
          await _dataService.fetchJsonFromNetwork<ProductListModel>(
        Method.GET,
        "/products/category/$category",
        mapper: (json) => ProductListModel.fromJson(json),
      );
      if (response != null) {
        productList.value = response;
      }
    } catch (ex) {
      Logger.log(ex);
    }
  }

  int calculateAmount(int price, double discount) {
    int itemPrice = price;
    itemPrice = price - price * discount ~/ 100;
    return itemPrice;
  }
}
