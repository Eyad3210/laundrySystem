import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/logic/controller/theme_controller.dart';
import 'package:project2/logic/controller/translate_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/utils/translate.dart';
import 'package:project2/view/screens/order_state/list_orders.dart';
import 'package:project2/view/screens/profile/profile.dart';

late Box box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox("mybox");
    print(box.get('login'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      translations: MyLocale(),
      locale: controller.initLang,
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      //  home:            ListOrders(),
      getPages: AppRoutes.routes,
      initialRoute:
          box.get('login') == null ? AppRoutes.login : AppRoutes.mainSreen,
    );
  }
}
