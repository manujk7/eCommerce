import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/product_category_controller.dart';

class ProductCategoryScreen extends GetWidget<ProductCategoryController> {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Obx(
          () => SafeArea(
            child: controller.categoryList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.categoryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide()),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(AppRoutes.productByCategoryScreen,
                                arguments: controller.categoryList[index]);
                          },
                          title: Text(
                              '${controller.categoryList[index].capitalizeFirst}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
