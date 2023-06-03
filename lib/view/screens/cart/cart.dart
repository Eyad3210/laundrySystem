
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/cart/component/cart_card.dart';
import 'package:project2/view/screens/cart/component/cart_total.dart';
import 'package:project2/view/screens/cart/component/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar:Obx(()=> controller.productsMap.isEmpty?const Text("") : CartTotal() ),
      appBar: AppBar(
        title:  Text('cart'.tr),
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.clearAllProducts();
            },
            icon: const Icon(Icons.backspace),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height
                  -200,
                    child: 
                    ListView.builder(itemBuilder: (context,index){
                       return CartProductCard(
                         control: controller,
                          index: index,
                          product:
                              controller.productsMap.keys.toList()[index],
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      },
                     
                      itemCount: controller.productsMap.length,
                    )
                    
                  
                  ),
                // CartTotal()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}