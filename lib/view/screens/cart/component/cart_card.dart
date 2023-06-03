import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/product.dart';
import 'package:project2/utils/const_string.dart';
import 'package:project2/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final CartController control;
  final Product product;
  final int index;
  final int quantity;
  CartProductCard({
    required this.control,
    required this.product,
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<CartController>();
  final controller1 = Get.find<OrderController>();
    final controllerProduct = Get.find<OrderController>();


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
                  product.name!,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               // Text(product.serviceTypeId.toString()),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller1.isQuick(false)
                      ? "${controller.productSubTotal[index]}"
                      : "${controller.productSubTotalVip[index]}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
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
          ),
        ],
      ),
    );
  }
}
