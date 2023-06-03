import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/logic/controller/complaint_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/complaint.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/order_state/order_state.dart';
import 'package:project2/view/widgets/costum_botton.dart';
import 'package:project2/view/widgets/custom_field.dart';
import 'package:project2/view/widgets/custom_text.dart';
import 'package:project2/view/widgets/drawer.dart';

class ListOrders extends StatelessWidget {
  ListOrders({Key? key}) : super(key: key);
  var controller = Get.put(OrderController());
  var controllerProduct = Get.put(ProductController());

  final TextEditingController description = TextEditingController();
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.ordersListGet.clear();
                controller.fetchOrders();
              },
              icon: Icon(Icons.refresh))
        ],
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ordersbar".tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           /*  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBotton(
                    text: "InProgress",
                    color: mainColor.withOpacity(0.5),
                  ),
                  CustomBotton(
                      text: "Completed", color: mainColor.withOpacity(0.5)),
                ],
              ),
            ), */
            SizedBox(
                height: size.height*0.7,
                child: Obx(
                  () => controller.ordersListGet.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.ordersListGet.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () async {
                                  //post get info
                                  controller.orderIdInfo =
                                      controller.ordersListGet[index].orderId;
                                  controllerProduct.productListOrder.clear();
                                  controllerProduct.fetchProductsOrder(
                                      controller.ordersListGet[index].orderId);

                                  await Get.dialog(Padding(
                                    padding: const EdgeInsets.only(
                                        left: 1,
                                        right: 1,
                                        top: 100,
                                        bottom: 100),
                                    child: Container(
                                      
                                      color: Colors.grey[300],
                                      child: Obx(() => ListView.builder(
                                          itemCount: controllerProduct
                                              .productListOrder.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    CustomText(
                                                      text: controllerProduct
                                                          .productListOrder[
                                                              index]
                                                          .name!,
                                                      size: 30,
                                                      color: mainColor,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomText(
                                                      text: controllerProduct
                                                          .productListOrder[
                                                              index]
                                                          .serviceTypeName!,
                                                      size: 30,
                                                      color: mainColor,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          })),
                                    ),
                                  ));
                                },
                                child: StateOrder(
                                    controller: controller,
                                    orderId:
                                        controller.ordersListGet[index].orderId,
                                    laundryName: controller
                                        .ordersListGet[index].laundryName,
                                    orderType: controller
                                        .ordersListGet[index].orderType,
                                    price:
                                        controller.ordersListGet[index].price,
                                    statusId: controller
                                        .ordersListGet[index].status_id));
                          })
                      : Center(
                          child: Lottie.asset("images/washer.json"),
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
