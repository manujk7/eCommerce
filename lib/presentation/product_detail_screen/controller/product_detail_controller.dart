import 'package:e_commerce_app/presentation/product_detail_screen/model/product_detail_model.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/message_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/progress_dialog_utils.dart';
import 'package:e_commerce_app/domain/data_service.dart';

class ProductDetailController extends GetxController {
  final DataService _dataService = Get.find<DataService>();

  Rx<ProductDetailModel> product = ProductDetailModel().obs;
  String id = "1";

  @override
  Future<void> onReady() async {
    super.onReady();
    if (Get.arguments != null) {
      id = Get.arguments;
    }

    ProgressDialogUtils.showProgressDialog();
    try {
      await Future.wait([
        getProductDetail(),
      ]);
      ProgressDialogUtils.hideProgressDialog();
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      MessageDialogUtils.showFailMessage(subtitle: ex.toString());
    }
  }

  Future getProductDetail() async {
    try {
      ProductDetailModel? response =
          await _dataService.fetchJsonFromNetwork<ProductDetailModel>(
        Method.GET,
        "/products/$id",
        mapper: (json) => ProductDetailModel.fromJson(json),
      );
      if (response != null) {
        product.value = response;
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
