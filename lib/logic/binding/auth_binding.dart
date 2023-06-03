import 'package:get/get.dart';
import 'package:project2/logic/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => AuthController());
  }
}
