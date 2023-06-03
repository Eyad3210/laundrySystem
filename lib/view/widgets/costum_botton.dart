import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final String ? text;
  final Color ? color;
  final VoidCallback? onPress;
   CustomBotton({ Key? key, this.text, this.color, this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                      child: Text(text!),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: color!,
                        minimumSize: Size(80, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed:onPress,
                    );
  }
}