import 'package:e_commerce_app/presentation/product_view_by_category/controller/product_view_by_category_controller.dart';
import 'package:get/get.dart';

class ProductViewByCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductViewByCategoryController());
  }
}
