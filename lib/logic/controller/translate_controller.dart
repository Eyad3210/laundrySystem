import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class MyLocaleController extends GetxController {
  @override
  void onInit() {
    setLang();
    super.onInit();
  }
    Box box = Hive.box("mybox");

  Locale? initLang;
  void setLang() {
    if (box.get("lang") == "ar") {
       initLang=const Locale("ar");
    } else {
       initLang=const Locale("en");
    }
  }

  void changeLanguage(String lang) {
    Locale locale = Locale(lang);
    box.put('lang', lang);
    Get.updateLocale(locale);
    print(lang);
  }
}
