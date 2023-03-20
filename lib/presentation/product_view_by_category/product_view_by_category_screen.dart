import 'package:e_commerce_app/presentation/product_view_by_category/controller/product_view_by_category_controller.dart';
import 'package:e_commerce_app/presentation/product_view_by_category/widgets/product_category_tile.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ProductViewByCategoryScreen
    extends GetWidget<ProductViewByCategoryController> {
  const ProductViewByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            backgroundColor: ColorConstant.whiteBg,
            height: getVerticalSize(
              56.00,
            ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstant.black900,
                ),
              ),
            ),
            leadingWidth: 24,
            centerTitle: true,
            title: Obx(
              () => Text(
                controller.category.value.capitalizeFirst ?? "",
                style: AppStyle.txtIBMPlexSansBold24Black900,
              ),
            )
            // styleType: Style.bgFillBlack900,
            ),
        backgroundColor: ColorConstant.whiteA700,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: ColorConstant.whiteA700Cc,
              child: Obx(
                () => Padding(
                  padding: getPadding(left: 24, top: 20, right: 24, bottom: 24),
                  child: controller.productList.value.products != null &&
                          controller.productList.value.products!.isNotEmpty
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 11,
                          ),
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              controller.productList.value.products!.length,
                          itemBuilder: (context, index) {
                            return ProductCategoryTile(
                              product:
                                  controller.productList.value.products![index],
                              productViewByCategoryController: controller,
                            );
                          },
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: const Text(
                              "Oops!!! There are no products at this moment."),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
