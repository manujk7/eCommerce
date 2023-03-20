import 'package:e_commerce_app/presentation/product_category_screen/controller/product_category_controller.dart';
import 'package:e_commerce_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../home_screen/controller/home_controller.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProductCategoryController());
    Get.lazyPut(() => ProfileController());
  }
}
