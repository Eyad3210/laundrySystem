import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/cart_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/models/product.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/cart/producr_cart.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  var controller = Get.put(CartController());
  var controllerProduct = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _appbar = AppBar(
      backgroundColor: mainColor,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text('clothes'.tr,
          style: TextStyle(
            fontSize: 20.0,
          )),
      actions: <Widget>[
        Obx(() => IconButton(
              icon: Badge(
                position: BadgePosition.topEnd(),
                badgeContent: Text("${controller.badgeCount}"),
                child: const Icon(
                  Icons.shopping_cart,
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.cartScreen);
              },
            )),
      ],
    );
    var s = mySize(
        PreferredSize(child: _appbar, preferredSize: Size.fromHeight(0)));
    return Scaffold(
      appBar: _appbar,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: mainColor,
              isScrollable: true,
              labelPadding: const EdgeInsets.only(left: 35, right: 35),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text('wash'.tr,
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ),
                Tab(
                  child: Text('iron'.tr,
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ),
                Tab(
                  child: Text('washandiron'.tr,
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                )
              ]),
          Container(
              height: s - 100,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                ProductCart(
                  service_type_id: 1,
                //  length: controllerProduct.productListGet1.length,
                //  pr: controllerProduct.productListGet1,
                ),
                ProductCart2(
                  service_type_id: 2,
                 // length: controllerProduct.productListGet2.length,
                 // pr: controllerProduct.productListGet2,
                ),
                ProductCart3(
                  service_type_id: 3,
                 // length: controllerProduct.productListGet3.length,
                  //pr: controllerProduct.productListGet3,
                )
              ]))
        ],
      ),
    );
  }
}
