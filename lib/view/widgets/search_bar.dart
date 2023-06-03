import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/widgets/custom_text.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20 / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: const Icon(Icons.search),
          hintText: "search".tr,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
/* class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const  [
         Icon(Icons.search,color: mainColor,size: 22,),
         CustomText(text: "Search about laundry name",color: Colors.black45,),
        ],
      ),
    );
  }
} */
