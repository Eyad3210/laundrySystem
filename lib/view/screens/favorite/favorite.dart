import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/laundries/single_laund.dart';
import 'package:project2/view/widgets/custom_text.dart';

class FavoriteLaundry extends StatelessWidget {
  FavoriteLaundry({Key? key}) : super(key: key);
  var controller = Get.put(LaundriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorite Laundries',
        ),
      ),
      body: Obx(()=>Padding(
        padding: const EdgeInsets.all(20),
        child: controller.laundriesListFavorite.isNotEmpty
            ? ListView.builder(
                itemCount: controller.laundriesListFavorite.length,
                itemBuilder: (context, index) {
                  return Singlelaunds(
                    photo: controller.laundriesListFavorite[index].photo,
                    press: () {},
                    name: controller.laundriesListFavorite[index].name,
                    address: controller.laundriesListFavorite[index].address,
                    isWork: controller.laundriesListFavorite[index].workOrNot,
                    laundryId: controller.laundriesListFavorite[index].id,
                    isFavorite:
                        controller.laundriesListFavorite[index].favorite,
                  );
                })
            : Center(
                child: CustomText(
                  text: "not found",
                  size: 50,
                ),
              ),
      )),
    );
  }
}
