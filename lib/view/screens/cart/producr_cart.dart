import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/product.dart';
import 'package:project2/utils/const_string.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/widgets/custom_text.dart';

class ProductCart extends StatelessWidget {
  final controller = Get.find<ProductController>();
  final controllerCart = Get.find<CartController>();
  final controllerOrder = Get.find<OrderController>();
  int? service_type_id;
  ProductCart({
    Key? key,
    required this.service_type_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return Obx(() => controller.isLoading.value == false
        ? LayoutBuilder(
            builder: (context, constraints) => GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.productListGet1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.biggest.aspectRatio * 3 / 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => controllerOrder.isQuick(false)
                    ? _buildCard(
                        name: controller.productListGet1[index].name!,
                        price:
                            controller.productListGet1[index].price!.toString(),
                        imgPath: controller.productListGet1[index].photo!,
                        //  discount    //   x=500-(500*50/100);
                        product: controller.productListGet1[index])
                    : _buildCard(
                        name: controller.productListGet1[index].name!,
                        price: controller.productListGet1[index].vipPrice!
                            .toString(),
                        imgPath: controller.productListGet1[index].photo!,
                        product: controller.productListGet1[index])),
          )
        : Center(
            child: Lottie.asset("images/washer.json"),
          ));
  }

  Widget _buildCard(
      {required String name,
      required String price,
      required String imgPath,
      required Product product}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7)
          ]),
      child: LayoutBuilder(
        builder: (context, constrains) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://laundries-project.000webhostapp.com/images/products/$imgPath"))),
                    )),
              ),
            ),
            Text(
              name.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(color: Color(0xFFEBEBEB), height: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
                InkWell(
                  onTap: () {
                    controllerCart.addProductToCart(product);
                    Get.snackbar("Added to Cart", "  ",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: mainColor.withOpacity(0.8),
                        margin: EdgeInsets.only(left: 40, right: 40),
                        colorText: Colors.white,
                        animationDuration: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 1000));
                  },
                  child: CustomText(
                    text: 'addtocart'.tr,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////
class ProductCart2 extends StatelessWidget {
  final controller = Get.find<ProductController>();
  final controllerCart = Get.find<CartController>();
  final controllerOrder = Get.find<OrderController>();
  int? service_type_id;
  ProductCart2({
    Key? key,
    required this.service_type_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return Obx(() => controller.isLoading.value == false
        ? LayoutBuilder(
            builder: (context, constraints) => GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.productListGet2.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.biggest.aspectRatio * 3 / 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => controllerOrder.isQuick(false)
                    ? _buildCard(
                        name: controller.productListGet2[index].name!,
                        price:
                            controller.productListGet2[index].price!.toString(),
                        imgPath: controller.productListGet1[index].photo!,
                        //  discount    //   x=500-(500*50/100);
                        product: controller.productListGet2[index])
                    : _buildCard(
                        name: controller.productListGet2[index].name!,
                        price: controller.productListGet2[index].vipPrice!
                            .toString(),
                        imgPath: controller.productListGet2[index].photo!,
                        product: controller.productListGet2[index])),
          )
        : Center(
            child: Lottie.asset("images/washer.json"),
          ));
  }

  Widget _buildCard(
      {required String name,
      required String price,
      required String imgPath,
      required Product product}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7)
          ]),
      child: LayoutBuilder(
        builder: (context, constrains) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://laundries-project.000webhostapp.com/images/products/$imgPath"))),
                    )),
              ),
            ),
            Text(
              name.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(color: Color(0xFFEBEBEB), height: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
                InkWell(
                  onTap: () {
                    controllerCart.addProductToCart(product);
                    Get.snackbar("Added to Cart", "  ",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: mainColor.withOpacity(0.8),
                        margin: EdgeInsets.only(left: 40, right: 40),
                        colorText: Colors.white,
                        animationDuration: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 1000));
                  },
                  child: CustomText(
                    text: 'addtocart'.tr,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////
class ProductCart3 extends StatelessWidget {
  final controller = Get.find<ProductController>();
  final controllerCart = Get.find<CartController>();
  final controllerOrder = Get.find<OrderController>();
  int? service_type_id;
  ProductCart3({
    Key? key,
    required this.service_type_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return Obx(() => controller.isLoading(false)
        ? LayoutBuilder(
            builder: (context, constraints) => GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.productListGet3.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.biggest.aspectRatio * 3 / 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => controllerOrder.isQuick(false)
                    ? _buildCard(
                        name: controller.productListGet3[index].name!,
                        price:
                            controller.productListGet3[index].price!.toString(),
                        imgPath: controller.productListGet3[index].photo!,
                        //  discount    //   x=500-(500*50/100);
                        product: controller.productListGet3[index])
                    : _buildCard(
                        name: controller.productListGet3[index].name!,
                        price: controller.productListGet3[index].vipPrice!
                            .toString(),
                        imgPath: controller.productListGet3[index].photo!,
                        product: controller.productListGet3[index])),
          )
        : Center(
            child: Lottie.asset("images/washer.json"),
          ));
  }

  Widget _buildCard(
      {required String name,
      required String price,
      required String imgPath,
      required Product product}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7)
          ]),
      child: LayoutBuilder(
        builder: (context, constrains) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://laundries-project.000webhostapp.com/images/products/$imgPath"))),
                    )),
              ),
            ),
            Text(
              name.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(color: Color(0xFFEBEBEB), height: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
                InkWell(
                  onTap: () {
                    controllerCart.addProductToCart(product);
                    Get.snackbar("Added to Cart", "  ",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: mainColor.withOpacity(0.8),
                        margin: EdgeInsets.only(left: 40, right: 40),
                        colorText: Colors.white,
                        animationDuration: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 1000));
                  },
                  child: CustomText(
                    text: 'addtocart'.tr,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}