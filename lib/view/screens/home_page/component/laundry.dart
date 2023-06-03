// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project2/view/widgets/custom_text.dart';

class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: Constraints.maxWidth / 1.7,
          margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow:const [
                BoxShadow(
                   color: Colors.black54,
                blurRadius: 0.1,
                offset: Offset(0, 0.1),
                spreadRadius: 0,
                  /* color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 5, */
                )
              ]),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage("images/lan.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   const [
                    Expanded(child: CustomText(text: "burger bebe",),

                     ) ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}