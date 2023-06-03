import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/complaint_controller.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/logic/controller/location.dart';
import 'package:project2/logic/controller/main_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/complaint.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(Location());
     Get.put(OrderController());
    Get.put(ProductController());
    Get.put(LaundriesController());
    Get.put(CartController());
    Get.put(ComplaintController());
  }
}
