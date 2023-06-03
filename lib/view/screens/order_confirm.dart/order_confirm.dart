import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/widgets/custom_text.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  DateTime datetime = DateTime.now();
  var controller = Get.find<OrderController>();
  var controllerCart = Get.find<CartController>();
  var controllerLands = Get.find<LaundriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
         /*  Get.snackbar("", "",
              titleText: Center(
                  child: CustomText(
                text: "order state on orders page",
                size: 18,
                color: Colors.white,
              )),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: mainColor.withOpacity(0.8),
              margin: EdgeInsets.only(left: 40, right: 40),
              colorText: Colors.white,
              animationDuration: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 4000)); */
        },
        child: Obx(()=> controller.isLoading(true)? GestureDetector(
          onTap: () {
            
            controller.isLoading(false);
                        print("hhhjhjhjhjhjhjh");

            print(controller.isLoading.value);
            print("hhhjhjhjhjhjhjh");
            print(controllerLands.laundryId!);
            print("hhhjhjhjhjhjhjh");
            print(controller.isQuick.value);
            print(controllerCart.productsList);
            controller.sendOrder2(
                controllerLands.laundryId!,
                controller.isQuick.value==false ? 0 : 1,
                "discription",
                controllerCart.productsList);
            controllerCart.productsMap.clear();

            //  Get.offNamed(Routes.mainScreen);
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                gradient: gradientStyle,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'placeorder'.tr,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ):Center(child: CircularProgressIndicator(color: mainColor,)),
      )),
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'confirmorder'.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Lottie.asset("images/truck.json"),
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              children: [
                CustomText(
                  text: 'thankmessage'.tr,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: controller.isQuick(false) ? 'time'.tr : 'timevip'.tr,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'numofclothes'.tr,
                  size: 18,
                ),
                CustomText(
                  text: controllerCart.productsList.length.toString(),
                  size: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'finalprice'.tr,
                  size: 18,
                ),
                CustomText(
                  text: controller.isQuick(false)
                      ? controllerCart.total.toString()
                      : controllerCart.totalVip.toString(),
                  size: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            divider(),
          ],
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18),
      height: 1,
      color: Colors.grey,
    );
  }
}

LinearGradient gradientStyle = LinearGradient(
    colors: [Color(0xfff3953b), Color(0xffe57509)],
    stops: [0, 1],
    begin: Alignment.topCenter);
