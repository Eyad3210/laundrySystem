import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/logic/controller/location.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/widgets/custom_text.dart';

class MyTitle extends StatelessWidget {
  String? text;
  MyTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 15, right: 15,),
      child: Row(            mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          CustomText(
            text: text!,
            size: 20,
          ),
            CustomText(
            text: "",
            size: 20,
          ),
        ],
      ),
    );
  }
}

class MyTitle2 extends StatelessWidget {
  String? text;
  MyTitle2({Key? key, required this.text}) : super(key: key);
  var cintroller = Get.put(LaundriesController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,c) {
        return Container(
        //  color: Colors.amber,
          height: c.maxHeight,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15, right: 15,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  cintroller.getNearBy();
                },
                child: CustomText(
                  text: text!,
                  size: 20,
            //    color: mainColor,
                ),
              ),
              Row(
                children: [
                  CustomText(
                    text: "viewall".tr,
                    size: 14,
                    color: mainColor,
                    onClick: (){Get.toNamed(Routes.laundsScreen);},
                  ),
                 const Icon(Icons.arrow_forward, color: mainColor, size: 20),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
