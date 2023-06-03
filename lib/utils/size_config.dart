import 'package:flutter/material.dart';

dynamic mySize(PreferredSize p) {
  double hight, appbar;
  hight = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  appbar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
  var s = hight - p.preferredSize.height - appbar;
  return s;
}
