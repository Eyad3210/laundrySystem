import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/main_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/home_page/home.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _BottomBarState();
}

class _BottomBarState extends State<MainScreen> {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "homebar".tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: "ordersbar".tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "favbar".tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "profile".tr),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: mainColor,
              unselectedItemColor: Colors.grey,
              iconSize: 25,
              backgroundColor: Colors.white,
              onTap: (index) => controller.currentIndex.value = index,
              elevation: 15),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs,
          ),
        ));
  }
}
