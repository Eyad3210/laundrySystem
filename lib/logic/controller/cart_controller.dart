import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/models/product.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/profile/profile.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;
  List productsList = [];
  RxInt badgeCount = 0.obs;

  void increaseBadge() {
    badgeCount.value = productsMap.values.length;
  }

  void addProductToCart(Product Product) {
    if (productsMap.containsKey(Product)) {
      productsMap[Product] += 1;
      productsList.add(Product.id!);
      print(productsList);

      increaseBadge();
    } else {
      productsMap[Product] = 1;
      productsList.add(Product.id!);
      print(productsList);

      increaseBadge();
    }
  }

  void removeProductsFarmCart(Product Product) {
    if (productsMap.containsKey(Product) && productsMap[Product] == 1) {
      productsMap.removeWhere((key, value) => key == Product);
      for (var i = 0; i <= productsList.length; i++) {
        if (productsList[i] == Product.id) {
          productsList.removeAt(i);
        }
      }
      print(productsList);
      increaseBadge();
    } else {
      for (var i = 0; i <= productsList.length; i++) {
        if (productsList[i] == Product.id) {
          productsList.removeAt(i);
          break;
        }
      }
      print(productsList);
      productsMap[Product] -= 1;
      increaseBadge();
    }
  }

  void removeOneProduct(Product Product) {
    productsMap.removeWhere((key, value) => key == Product);
    while (productsList.contains(Product.id)) {
      productsList.remove(Product.id);
    }
    increaseBadge();

    print(productsList);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey[300],
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        productsList.clear();
        print(productsList);

        badgeCount.value = 0;
        Get.back();
      },
      buttonColor: Get.isDarkMode ? Colors.red : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element);
  ///////////////////////vip/////////////////////////////
  get productSubTotalVip =>
      productsMap.entries.map((e) => e.key.vipPrice * e.value).toList();

  get totalVip => productsMap.entries
      .map((e) => e.key.vipPrice * e.value)
      .toList()
      .reduce((value, element) => value + element);
   int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  } 
}
