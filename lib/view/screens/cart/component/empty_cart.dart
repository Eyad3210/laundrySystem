import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 150,
              //  color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'cart'.tr+" ",
                    style: TextStyle(
                      color: Colors.black,
                      // color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'empty'.tr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  //  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  Get.toNamed(Routes.mainScreen);
                },
                child:  Text(
                  'homebar'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
