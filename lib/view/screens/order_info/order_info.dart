import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/order.dart';
import 'package:project2/models/product.dart';
import 'package:project2/utils/const_string.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/cart/component/cart_card.dart';
import 'package:project2/view/screens/cart/component/cart_total.dart';
import 'package:project2/view/screens/cart/component/empty_cart.dart';

class OrderInfo extends StatelessWidget {
  OrderInfo({Key? key,}) : super(key: key);

  final controllerProduct = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('=Order info'),
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.backspace),
          ),
        ],
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: size.height - 200,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return OrderInfoCart(
                          index: index,
                          name: controllerProduct.productListOrder[index].name!,
                          serviceType: controllerProduct
                              .productListOrder[index].serviceTypeName!,
                        );
                      },
                      itemCount: controllerProduct.productListOrder.length,
                    )),
                // CartTotal()
              ],
            ),
          );
        },
      ),
    );
  }
}

class OrderInfoCart extends StatelessWidget {
  final String name;
  final String serviceType;

  final int index;
  OrderInfoCart({
    required this.index,
    required this.name,
    required this.serviceType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(controller.productSubTotal[index].toString());
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
             /*  image: DecorationImage(
                image: AssetImage(imageClothes[index]),
                fit: BoxFit.cover,
              ), */
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(serviceType),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          /*  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFarmCart(product);
                      controller.increaseBadge();
                    },
                    icon: Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(product);
                      controller.increaseBadge();
                    },
                    icon: Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(product);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
