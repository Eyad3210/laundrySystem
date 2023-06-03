import 'package:flutter/material.dart';
import 'package:project2/utils/theme.dart';

class CustomField extends StatelessWidget {
  final IconData icon;
    final Widget sicon;

  final String text;
  final bool obscure;
  final VoidCallback? ontap;
  final VoidCallback? onsave;
  final Function(String)? validator;
  final TextEditingController? controller;

  CustomField(
      {Key? key,
      required this.icon,
      required this.text,
      required this.obscure,
      this.onsave,
      this.ontap,
      this.validator,
      this.controller, required this.sicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: mainColor,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon:sicon ,
          prefixIcon: Icon(
            icon,
            color: mainColor,
          ),
          focusedBorder:const  OutlineInputBorder(  
            borderRadius:  BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: mainColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.grey[400]!)),
          labelText: text,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 15)),
    );
  }
}
