import 'package:get/get.dart';
import 'package:project2/logic/binding/auth_binding.dart';
import 'package:project2/logic/binding/main_binding.dart';
import 'package:project2/view/screens/auth/login.dart';
import 'package:project2/view/screens/auth/signup.dart';
import 'package:project2/view/screens/cart/add_to_cart.dart';
import 'package:project2/view/screens/cart/cart.dart';
import 'package:project2/view/screens/complaints/complaint.dart';
import 'package:project2/view/screens/favorite/favorite.dart';
import 'package:project2/view/screens/home_page/component/main_screen.dart';
import 'package:project2/view/screens/home_page/home.dart';
import 'package:project2/view/screens/laund_details/laund_details.dart';
import 'package:project2/view/screens/laundries/launds.dart';
import 'package:project2/view/screens/order_confirm.dart/order_confirm.dart';
import 'package:project2/view/screens/order_info/order_info.dart';
import 'package:project2/view/screens/order_state/list_orders.dart';
import 'package:project2/view/screens/order_state/order_state.dart';
import 'package:project2/view/screens/profile/profile.dart';

class AppRoutes {
  static const mainSreen = Routes.mainScreen;
  static const login = Routes.loginScreen;
  static final routes = [
    GetPage(
        name: Routes.loginScreen, page: () => LogIn(), binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen, page: () => SignUp(), binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [MainBininding(), AuthBinding()]),
    GetPage(
        name: Routes.laundsScreen,
        page: () => Laundries(),
        bindings: [MainBininding()]),
    GetPage(
        name: Routes.addToCartScreen,
        page: () => AddToCart(),
        bindings: [MainBininding()]),
    GetPage(
        name: Routes.detailsScreen,
        page: () => const LaundDetails(),
        bindings: [MainBininding()]),
    GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
        bindings: [MainBininding()]),
    GetPage(
        name: Routes.orderConfirm,
        page: () => ConfirmOrder(),
        bindings: [AuthBinding(), MainBininding()]),
    GetPage(
        name: Routes.profile,
        page: () => Profile(),
        bindings: [AuthBinding(), MainBininding()]),
    /* GetPage(
        name: Routes.orders,
        page: () => ListOrders(),
        bindings: [MainBininding()]), */
    GetPage(
        name: Routes.orderInfo,
        page: () => OrderInfo(),
        bindings: [MainBininding()]),
    GetPage(
        name: Routes.complaint,
        page: () => ListComplaint(),
        bindings: [MainBininding()]),
        GetPage(
        name: Routes.favorite,
        page: () => FavoriteLaundry(),
        bindings: [MainBininding()]),
  ];
}

class Routes {
  static const welcomeScreen = "/welcomeScreen";
  static const mainScreen = "/mainScreen";
  static const loginScreen = "/loginScreen";
  static const signScreen = "/signScreen";
  static const homeScreen = "/homeScreen";
  static const laundsScreen = "/laundsScreen";
  static const addToCartScreen = "/addToCartScreen";
  static const detailsScreen = "/DetailsScreen";
  static const cartScreen = "/cartScreen";
  static const orderConfirm = "/orderConfirm";
  static const profile = "/profile";
  static const orders = "/orders";
  static const orderInfo = "/orderInfo";
  static const complaint = "/complaint";
    static const favorite = "/favorite";

}
