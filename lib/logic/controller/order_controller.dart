import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:project2/routes/routes.dart';
import 'package:project2/services/remote_services.dart';
import 'package:project2/utils/const_string.dart';

class OrderController extends GetxController {
  Order order = Order();
  String? selectedValue;
  int? orderIdInfo;
  AuthController auth = AuthController();
  RemoteServices remote = RemoteServices();
  var isLoading = true.obs;

  var ordersListGet = <Order>[].obs;

  var isQuick = false.obs;
  var box = Hive.box("mybox");
  String getToken() {
    String t = box.get("login");
    return t;
  }

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  void onSelected(String value) {
    selectedValue = value;
    update();
  }

  void sendOrder2(
      int laundry_id, int order_type, String discription, productIds) async {
    isLoading(false);
    String t = getToken();

    var response = await Dio().post("$baseUrl/api/addOrder",
        options: Options(headers: {"Authorization": "Bearer $t"}),
        data: {
          "laundry_id": "$laundry_id",
          "order_type": "$order_type",
          "description": "anything",
          "products": productIds
        });
      isLoading(true);

    print(response.data);
    if (response.data['status'] == true) {
      Get.offAllNamed(Routes.mainScreen);
    }else Get.snackbar("faild", "");
  }

  void fetchOrders() async {
    try {
      isLoading(true);
      var orders = await remote.fetchOrders();
      if (orders != null) {
        
        ordersListGet.value = orders;
        print(ordersListGet);
      }
    } finally {
      isLoading(false);
    }
  }

  void canelOrder(orderId) async {
    String t = getToken();
    print(orderId);
    print(t);
    print("$baseUrl/api/deleteOrder/$orderId");

    var response = await http.get(
        Uri.parse("$baseUrl/api/deleteOrder/$orderId"),
        headers: {"Authorization": "Bearer $t"});
    print(response.body);
  }
}
