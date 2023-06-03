import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/home_page/component/main_screen.dart';
import 'package:project2/view/screens/home_page/component/grid_laundry.dart';
import 'package:project2/view/screens/home_page/component/services_grid.dart';
import 'package:project2/view/screens/home_page/component/slider.dart';
import 'package:project2/view/screens/home_page/component/title.dart';
import 'package:project2/view/widgets/drawer.dart';
import 'package:project2/view/widgets/search_bar.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _appbar = PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
         title: Text("Dr.wash"),
         centerTitle: true,
          elevation: 0,
          backgroundColor: mainColor,
          //automaticallyImplyLeading: false, // hides leading widget
        ));
    var s = mySize(_appbar);

    return Scaffold(
      drawer: NavigationDrawer(),
      //bottomNavigationBar: MainScreen(),
      appBar: _appbar,
      body: SizedBox(
        height: s,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Carousol(),
              SizedBox(height: s * 0.06, child: MyTitle(text: "homet1".tr)),
              SizedBox(height: s * 0.14, child: const ServicesGrid()),
              SizedBox(
                  height: s * 0.06,
                  child: MyTitle2(
                    text: "homet2".tr,
                  )),
              SizedBox(
                  height: s * 0.34,
                  width: size.width,
                  child:  ListLaundry1()),
              SizedBox(height: s * 0.06, child:  MyTitle(text: "homet3".tr)),
              SizedBox(
                  height: s * 0.34,
                  width: size.width,
                  child:  ListLaundry2()),
            ],
          ),
        ),
      ),
    );
  }
}
