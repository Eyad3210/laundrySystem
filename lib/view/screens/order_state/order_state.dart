import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project2/logic/controller/complaint_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/utils/const_string.dart';

import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/profile/profile.dart';
import 'package:project2/view/widgets/costum_botton.dart';
import 'package:project2/view/widgets/custom_field.dart';
import 'package:project2/view/widgets/custom_text.dart';

class StateOrder extends StatelessWidget {
  final int? orderId;
  final String? laundryName;
  final int? orderType;
  final int? price;
  final int? statusId;
  final OrderController controller;
  StateOrder({
    Key? key,
    required this.orderId,
    required this.laundryName,
    required this.orderType,
    required this.price,
    required this.statusId,
    required this.controller,
  }) : super(key: key);
  bool isCopleted = false;
  bool isPending = false;
  var controllerComp = Get.find<ComplaintController>();
  final TextEditingController description = TextEditingController();
  var box = Hive.box("mybox");
  String getToken() {
    String t = box.get("login");
    return t;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      height: size.height * 0.4,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Order id ${orderId}",
                size: 20,
              ),
              Column(
                children: [
                  statusId == 1
                      ? CustomBotton(
                          text: 'cancel'.tr,
                          color: Colors.red[400],
                          onPress: ()async {
                            controller.canelOrder(orderId);
                            controller.ordersListGet.clear();
                            await new Future.delayed(
                                  const Duration(seconds: 2));
                            controller.fetchOrders();
                            
                          },
                        )
                      : Text(""),
                  statusId == 3
                      ? CustomBotton(
                          text: 'Send Complaint',
                          color: Colors.green[300],
                          onPress: () {
                            AwesomeDialog(
                              context: context,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                controllerComp.sendComplaint(
                                    int.parse(controller.selectedValue!),
                                    orderId,
                                    description.text);
                              },
                              showCloseIcon: true,
                              btnOkText: "Send",
                              dialogType: DialogType.NO_HEADER,
                              body: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Send complaiment',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Material(
                                        elevation: 0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 15),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              border: Border.all(
                                                width: 1,
                                                color: mainColor,
                                              )),
                                          child: DropdownButton<String>(
                                              underline: Container(),
                                              hint: Center(
                                                  child:
                                                      Text("type complaint")),
                                              ////controller.selectedValue,
                                              value: controller.selectedValue,
                                              onChanged: (newValue) {
                                                controller
                                                    .onSelected(newValue!);
                                              },
                                              elevation: 15,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Center(
                                                      child: Text("فقدان قطع")),
                                                  value: '1',
                                                ),
                                                DropdownMenuItem(
                                                  child: Center(
                                                      child: Text("نظافة")),
                                                  value: '2',
                                                ),
                                                DropdownMenuItem(
                                                  child: Center(
                                                      child:
                                                          Text("سوء معاملة")),
                                                  value: '2',
                                                ),
                                                DropdownMenuItem(
                                                  child: Center(
                                                      child: Text("اخر")),
                                                  value: '3',
                                                )
                                              ]),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Material(
                                      elevation: 0,
                                      child: CustomField(
                                          controller: description,
                                          sicon: Text(""),
                                          icon: Icons.article,
                                          text: "description",
                                          obscure: false,
                                          validator: (value) {}),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            )..show();
                          },
                        )
                      : Container(),
                  statusId == 5
                      ? CustomText(
                          text: "Deleted",
                          color: Colors.red,
                          size: 20,
                        )
                      : Container(),
                  statusId == 4
                      ? CustomText(
                          text: "Rejected",
                          color: Colors.red,
                          size: 20,
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: laundryName!,
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: orderType == 0 ? "Normal Order" : "Quick Order",
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: price.toString(),
            size: 20,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 50, right: 20),
                height: 4,
                color: Colors.grey,
              ),
              statusId != 4 || statusId != 5
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        statusWidget(
                            "progress".tr, statusId == 1 ? true : false),
                        statusWidget(
                            "pending".tr, statusId == 2 ? true : false),
                        statusWidget(
                            "complete".tr, statusId == 3 ? true : false),
                      ],
                    )
                  : CustomText(
                      text: statusId == 4 ? "Rejected" : "Deleted",
                      color: Colors.red,
                      size: 30,
                      fontWeight: FontWeight.bold,
                    ),
            ],
          ),
         /*  statusId == 3
              ? Center(
                  child: RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) async {
                      String t = getToken();
                      print(t);
                      var response = await Dio().post(
                          "$baseUrl/api/addEvaluationToOrder",
                          options:
                              Options(headers: {"Authorization": "Bearer $t"}),
                          data: {
                            "order_id": orderId,
                            "number_of_star": rating.toInt(),
                            "message": "like"
                          });
                      print(response.data);
                    },
                  ),
                )
              : Container() */
        ],
      ),
    );
  }

  Container statusWidget(String status, bool isActive) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Color(0xfff3953b) : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Color(0xfff3953b),
                    width: 3)),
          ),
          SizedBox(
            width: 50,
          ),
          CustomText(
            text: status,
            color: (isActive) ? Colors.orange : Colors.black,
          ),
        ],
      ),
    );
  }
}
