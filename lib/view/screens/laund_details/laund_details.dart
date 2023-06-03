import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/laund_details/laund_info.dart';
import 'package:project2/view/screens/laund_details/laund_prices.dart';
import 'package:project2/view/screens/laund_details/laund_services.dart';
import 'package:project2/view/widgets/custom_icon.dart';

class LaundDetails extends StatelessWidget {
  const LaundDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _appbar = PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: SliverAppBar(
        bottom: PreferredSize(
            child: Container(
              height: 10,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    height: 3,
                    width: 50,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.white),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            ),
            preferredSize: const Size.fromHeight(0)),
        backgroundColor: mainColor,
        pinned: true,
        snap: false,
        floating: false,
        expandedHeight: size.height * 0.25,
       automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            GestureDetector(
              onTap: (){Get.back();},
              child: const CustomIcon(
                  icon: Icon(
                Icons.arrow_back,
              
              )),
            ),
          const  CustomIcon(
                icon: Icon(
              Icons.favorite,
            )),
          ],
        ),
        flexibleSpace: FlexibleSpaceBar(
          //  title: const Text("FlexibleSpace title"),
          centerTitle: true,
          background: Image.asset(
            'images/test.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height * 0.25,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.addToCartScreen);
              },
              child: Container(
                child: const Center(
                    child: AutoSizeText(
                  "Order now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: size.height * 0.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.addToCartScreen);
              },
              child: Container(
                child: const Center(
                  child: AutoSizeText(
                    "Quick order",
                    style: TextStyle(fontSize: 18, color: mainColor),
                  ),
                ),
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: mainColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _appbar,
          const LaundInfo(),
          const LaundServices(),
          const LaundPrices(),
          SliverToBoxAdapter(
            child: Container(
              height: 90,
            ),
          )
        ],
      ),
      //bottomNavigationBar: this._getBottomAppBar(),
    );
  }
}
