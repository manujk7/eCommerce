import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/presentation/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../../home_screen/models/product_list_model.dart';
import '../controller/product_view_by_category_controller.dart';

class ProductCategoryTile extends StatelessWidget {
  final Product product;
  final ProductViewByCategoryController productViewByCategoryController;

  ProductCategoryTile(
      {Key? key,
      required this.product,
      required this.productViewByCategoryController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productScreen, arguments: product.id.toString());
      },
      child: Container(
        height: getVerticalSize(230),
        width: getHorizontalSize(158),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            border: Border.all(
                color: ColorConstant.black900.withOpacity(0.5), width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: SizedBox(
                height: getVerticalSize(
                  158.00,
                ),
                width: getHorizontalSize(
                  158.00,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomImageView(
                        url: product.thumbnail,

                        // imagePath: ImageConstant.imgAudiobookCollection,
                        height: getVerticalSize(
                          158.00,
                        ),
                        radius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        width: getHorizontalSize(
                          158.00,
                        ),
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 8, left: 4),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      product.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtIBMPlexSansMedium14Black900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(top: 4, left: 4),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "₹${productViewByCategoryController.calculateAmount(product.price!, product.discountPercentage!)}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtIBMPlexSansRegular12Black900,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      "₹${product.price}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                          AppStyle.txtIBMPlexSansRegular12Black900LineThrough,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(top: 4, left: 4),
              child: Row(
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
                      "${product.rating}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtIBMPlexSansMedium14Black900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    );
  }
}
