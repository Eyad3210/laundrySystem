import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();
  final controller1 = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.grey[300],
        height: 100,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('total'.tr),
                  Text(controller1.isQuick(false)?
                    "\$${controller.total}": "\$${controller.totalVip}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  elevation: 0,
                  primary: mainColor,
                ),
                onPressed: () {
                  Get.toNamed(Routes.orderConfirm);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'confirm'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
