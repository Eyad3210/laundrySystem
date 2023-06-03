import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/logic/controller/order_controller.dart';
import 'package:project2/logic/controller/product_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/services/remote_services.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/laundries/launds.dart';
import 'package:project2/view/screens/order_confirm.dart/order_confirm.dart';

class Singlelaunds extends StatelessWidget {
  Singlelaunds({
    Key? key,
    required this.press,
    required this.name,
    required this.address,
    required this.isWork,
    required this.laundryId,
    required this.isFavorite,
    required this.photo,
  }) : super(key: key);
  final VoidCallback press;
  final controller = Get.find<OrderController>();
  final controllerLand = Get.find<LaundriesController>();
  final controllerProduct = Get.find<ProductController>();

  var remote = RemoteServices();
  final int? laundryId;
  final String? name;
  final String? address;
  final int? isWork;
  bool? isFavorite;
  final String? photo;
  getUserId() async {
    var box = await Hive.box('myBox');
    int userId = await box.get('userId');
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 250,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              'https://laundries-project.000webhostapp.com/images/laundries/$photo',
              radius: 25,
              width: double.infinity,
              height: 150,
            ),
            Positioned(
                right: 20,
                top: 130,
                child: GetBuilder<LaundriesController>(builder: (_) {
                  return GestureDetector(
                    onTap: () async {
                      print("tapettttttttt");
                      print(isFavorite);
                      print("sex");
                      //print(controllerLand.statIcon);
                      isFavorite == false
                          ? controllerLand.addFavorite(laundryId)
                          : controllerLand.deleteFavorite(laundryId);
                      controllerLand.laundriesListGet.clear();
                      controllerLand.laundriesListFavorite.clear();
                      await new Future.delayed(const Duration(seconds: 2));
                      controllerLand.fetchLaundries();
                      controllerLand.fetchFavoriteLands(getUserId());
                    },
                    child: IconBox(
                        child: Icon(
                          isFavorite == false
                              ? Icons.favorite_outline
                              : Icons.favorite,
                          color: mainColor,
                          size: 20,
                        ),
                        bgColor: Colors.white),
                  );
                })),
            Positioned(
              right: 15,
              top: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text("order".tr),
                    style: ElevatedButton.styleFrom(
                      //  onPrimary: Colors.white,
                      primary: mainColor,
                      minimumSize: Size(80, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      controllerLand.laundryId = laundryId;
                      controller.isQuick(false);
                      print("false false false");

                      print(controller.isQuick);
                      controllerProduct.productListGet.clear();
                      controllerProduct.productListGet1.clear();
                      controllerProduct.productListGet2.clear();
                      controllerProduct.productListGet3.clear();
                      await new Future.delayed(const Duration(seconds: 2));
                      controllerProduct.fetchProducts(laundryId);

                      // remote.fetchProducts(laundryId);
                      Get.toNamed(Routes.addToCartScreen);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text("quickorder".tr),
                    style: ElevatedButton.styleFrom(
                      // onPrimary: Colors.white,
                      primary: Color(0xfff3953b),
                      minimumSize: Size(80, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      controllerLand.laundryId = laundryId;
                      controller.isQuick(true);
                      print("fassssttttttt");
                      print(controller.isQuick);
                      controllerProduct.productListGet.clear();
                      controllerProduct.productListGet1.clear();
                      controllerProduct.productListGet2.clear();
                      controllerProduct.productListGet3.clear();
                      controllerProduct.fetchProducts(laundryId);
                      await new Future.delayed(const Duration(seconds: 2));
                      Get.toNamed(Routes.addToCartScreen);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
                left: 15,
                top: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Color(0xFF3E4249),
                          size: 13,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          address!,
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFF3E4249)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: isWork == 0 ? Colors.red : Colors.green,
                          size: 13,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          isWork == 1 ? 'online'.tr : 'offline'.tr,
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFF3E4249)),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  IconBox(
      {Key? key,
      required this.child,
      this.bgColor,
      this.onTap,
      this.borderColor = Colors.transparent,
      this.radius = 50})
      : super(key: key);
  final Widget child;
  final Color borderColor;
  final Color? bgColor;
  final double radius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage(this.name,
      {this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.isNetwork = true,
      this.radius = 50});
  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        image: DecorationImage(image: NetworkImage(name), fit: BoxFit.fill),
      ),
    );
  }
}
