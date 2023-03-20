import 'package:e_commerce_app/presentation/home_screen/models/product_list_model.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/message_dialog_utils.dart';
import 'package:e_commerce_app/core/utils/progress_dialog_utils.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/models/user.dart';

class HomeController extends GetxController {


  final DataService _dataService = Get.find<DataService>();
  RxList<Product> productList = RxList();
  final TextEditingController searchController = TextEditingController();
  late bool isLastPage;
  late int _pageNumber;
  late bool error;
  late bool loading;
  late int _numberOfPostsPerRequest;
  ScrollController scrollController = ScrollController();
  int skip = 0;

  @override
  Future<void> onReady() async {
    _pageNumber = 0;
    isLastPage = false;
    error = false;
    _numberOfPostsPerRequest = 10;
    scrollController.addListener(() {
// nextPageTrigger will have a value equivalent to 80% of the list size.
      var nextPageTrigger = 0.9 * scrollController.position.maxScrollExtent;

// _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
      if (scrollController.position.pixels > nextPageTrigger) {
        ProgressDialogUtils.showProgressDialog();
        getProductList();
      }
    });
    super.onReady();

    ProgressDialogUtils.showProgressDialog();
    try {
      await Future.wait([
        getProductList(),
      ]);

      // ProgressDialogUtils.hideProgressDialog();
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      MessageDialogUtils.showFailMessage(subtitle: ex.toString());
    }
  }

  Future getProductList() async {
    try {
      ProductListModel? response = await _dataService
          .fetchJsonFromNetwork<ProductListModel>(Method.GET, "/products",
              mapper: (json) => ProductListModel.fromJson(json),
              queryParameters: {
            "limit": _numberOfPostsPerRequest,
            "skip": skip
          });
      ProgressDialogUtils.hideProgressDialog();

      if (response != null) {
        isLastPage = productList.length < _numberOfPostsPerRequest;
        _pageNumber = _pageNumber + 1;
        skip = skip + _numberOfPostsPerRequest;
        productList.addAll(response.products!);
      }
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(ex);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future getProductSearchedList(String searchText) async {
    try {
      ProductListModel? response = await _dataService
          .fetchJsonFromNetwork<ProductListModel>(
              Method.GET, "/products/search",
              mapper: (json) => ProductListModel.fromJson(json),
              queryParameters: {
            "q": searchText,
          });
      ProgressDialogUtils.hideProgressDialog();
      if (response != null) {
        productList.value = response.products!;
      }
    } catch (ex) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(ex);
    }
  }

  int calculateAmount(int price, double discount) {
    int itemPrice = price;
    itemPrice = price - price * discount ~/ 100;
    return itemPrice;
  }
}
