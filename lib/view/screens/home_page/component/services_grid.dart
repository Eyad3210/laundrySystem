import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project2/view/widgets/custom_text.dart';


class ServicesGrid extends StatelessWidget {
  const ServicesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> services = [
      {"icon": "images/vmhome.png", "text": "wash".tr},
      {"icon": "images/ironhome.png", "text": "iron".tr},
      {"icon": "images/dhome.png", "text": "delivery".tr},
      
    ];
    return LayoutBuilder(builder: (context, c) {
      return Container(
        //height: c.maxHeight,
        //  width: c.maxWidth,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            services.length,
            (index) => CategoryCard(
              icon: services[index]["icon"],
              text: services[index]["text"],
              press: () {},
            ),
          ),
        ),
      );
    });
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: LayoutBuilder(builder: (context, c) {
        return Column(
          children: [
            Container(
              height: c.maxHeight * 0.7,
               padding: const EdgeInsets.all(5),
              //  height: 55,
              // width: 55,

              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                icon!,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
                height: c.maxHeight * 0.2,
                child: CustomText(text: text!,size: 15,))
          ],
        );
      }),
    );
  }
}
