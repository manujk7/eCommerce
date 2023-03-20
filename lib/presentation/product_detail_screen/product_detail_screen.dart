import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/product_detail_controller.dart';

class ProductDetailScreen extends GetWidget<ProductDetailController> {
  const ProductDetailScreen({super.key});

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
                controller.product.value.title ?? "",
                style: AppStyle.txtIBMPlexSansBold24Black900,
              ),
            )
            // styleType: Style.bgFillBlack900,
            ),
        backgroundColor: ColorConstant.whiteA700,
        body: Obx(
          () => SafeArea(
            child: controller.product.value.id != null
                ? SingleChildScrollView(
                    child: Container(
                      // height: getVerticalSize(230),
                      // width: getHorizontalSize(158),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CarouselSlider(
                            items: buildScroll(),
                            options: CarouselOptions(
                                height: 250,
                                autoPlay: true,
                                enableInfiniteScroll: false,
                                enlargeCenterPage: false,
                                reverse: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  // controller.currentScroll.value = index;
                                }),
                          ),
                          Padding(
                            padding: getPadding(top: 4, left: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    controller.product.value.title ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtIBMPlexSansSemiBold16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 4, left: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "₹${controller.calculateAmount(controller.product.value.price!, controller.product.value.discountPercentage!)}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtIBMPlexSansSemiBold16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Flexible(
                                  child: Text(
                                    "₹${controller.product.value.price}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppStyle
                                        .txtIBMPlexSansRegular12Black900LineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 4, left: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Flexible(
                                  child: Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Flexible(
                                  child: Text(
                                    "${controller.product.value.rating}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtIBMPlexSansMedium14Black900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 4, left: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Stock remaining - ${controller.product.value.stock}" ??
                                        "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtIBMPlexSansSemiBold16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildScroll() {
    if (controller.product.value.images != null) {
      return controller.product.value.images!.map<Widget>((image) {
        return Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        );
      }).toList();
    } else {
      return [Container()];
    }
  }
}
