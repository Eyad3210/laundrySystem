import 'package:flutter/material.dart';
import 'package:project2/view/widgets/custom_text.dart';

class ComplaintCard extends StatelessWidget {
  ComplaintCard({Key? key, required this.name, required this.nameState})
      : super(key: key);
  final String? name;
  final String? nameState;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: size.height * 0.25,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: name!,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 30,
          ),
          CustomText(
            text: nameState!,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 30,
          ),
        ],
      ),
    );
  }
}
