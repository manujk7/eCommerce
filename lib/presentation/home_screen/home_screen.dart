import 'package:e_commerce_app/presentation/home_screen/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(// this is new
        builder: (BuildContext context, StateSetter setState) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: SafeArea(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Container(
                color: ColorConstant.whiteA700Cc,
                child: Obx(
                  () => Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 24, right: 24, top: 24),
                        child: Container(
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                              color: ColorConstant.blueGray50),
                          child: TextFormField(
                            controller: controller.searchController,
                            style: AppStyle.txtIBMPlexSansRegular16,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: "Search Products",
                              contentPadding: const EdgeInsets.only(
                                  left: 24.0, top: 17, bottom: 17, right: 24),
                              hintStyle: TextStyle(
                                  color:
                                      ColorConstant.black900.withOpacity(0.4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.black900, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (value) {
                              controller.getProductSearchedList(value);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: getPadding(
                            left: 24, top: 20, right: 24, bottom: 24),
                        child: controller.productList.isNotEmpty
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
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.productList.length,
                                itemBuilder: (context, index) {
                                  if (index == controller.productList.length) {
                                    if (controller.error) {
                                      return const Center(
                                        child: Text(
                                          "Something went wrong",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    }
                                  }
                                  return ProductTile(
                                    product: controller.productList[index],
                                    homeController: controller,
                                  );
                                },
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: const Text(
                                    "Oops!!! There are no products at this moment."),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
