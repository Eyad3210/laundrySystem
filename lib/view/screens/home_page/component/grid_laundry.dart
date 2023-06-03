import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/home_page/component/single_laundry.dart';
import 'package:project2/view/widgets/custom_text.dart';

class ListLaundry2 extends StatelessWidget {
  ListLaundry2({
    Key? key,
  }) : super(key: key);
  var controller = Get.find<LaundriesController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Obx(() => controller.laundriesListNearBy.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.laundriesListNearBy.length,
              itemBuilder: (context, i) {
                return Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 15),
                    //   height: cc.maxHeight*0.5,
                    width: c.maxWidth * 0.53,
                    child: SingleLaundry(
                                            photo: controller.laundriesListGet[i].photo!,

                        name: controller.laundriesListNearBy[i].name!,
                        press: () {},
                        adress: controller.laundriesListNearBy[i].address!,
                        state: controller.laundriesListNearBy[i].workOrNot!));
              })
          : Center(
              child: CustomText(
              text: "Not Found NearBy Laundries",
              color: mainColor,
            )));
    });
  }
}

class ListLaundry1 extends StatelessWidget {
  ListLaundry1({
    Key? key,
  }) : super(key: key);
  var controller = Get.find<LaundriesController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Obx(() => controller.laundriesListGet.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, i) {
                return Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 15),
                    //   height: cc.maxHeight*0.5,
                    width: c.maxWidth * 0.53,
                    child: SingleLaundry(
                      photo: controller.laundriesListGet[i].photo!,
                        name: controller.laundriesListGet[i].name!,
                        press: () {},
                        adress: controller.laundriesListGet[i].address!,
                        state: controller.laundriesListGet[i].workOrNot!));
              })
          : Center(
              child: CircularProgressIndicator(
              color: mainColor,
            )));
    });
  }
}
