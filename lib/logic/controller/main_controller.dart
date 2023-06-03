import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/screens/auth/login.dart';
import 'package:project2/view/screens/auth/signup.dart';
import 'package:project2/view/screens/favorite/favorite.dart';
import 'package:project2/view/screens/home_page/home.dart';
import 'package:project2/view/screens/laundries/launds.dart';
import 'package:project2/view/screens/order_state/list_orders.dart';
import 'package:project2/view/screens/profile/profile.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
   
  var tabs = [
    const Home(),
    ListOrders(),
    FavoriteLaundry(),
    Profile(),
  ].obs;

  /*  var title = [
    "Home",
    "Favourites",
    'Cart',
    "Profile",
  ].obs; */
}
