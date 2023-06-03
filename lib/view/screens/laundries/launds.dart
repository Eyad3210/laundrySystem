import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/models/laundry.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/home_page/component/single_laundry.dart';
import 'package:project2/view/screens/laundries/single_laund.dart';
import 'package:project2/view/widgets/costum_botton.dart';
import 'package:project2/view/widgets/custom_text.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:project2/view/widgets/search_bar.dart';
import 'package:get/get.dart';

class Laundries extends StatelessWidget {
  Laundries({
    Key? key,
  }) : super(key: key);
  @override
  var controller = Get.find<LaundriesController>();
  Widget build(BuildContext context) {
    var _appbar = PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          centerTitle: true,
        ),
        preferredSize: const Size.fromHeight(0));
    var s = mySize(_appbar);
    String search = '';
    return Scaffold(
      backgroundColor: mainColor,
      appBar: _appbar,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(builder: (context, c) {
          return Column(
            children: <Widget>[
              SearchBar(onChanged: (value) {}),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    CustomBotton(
                      text: 'all'.tr,
                      color: Colors.white.withOpacity(0.5),
                      onPress: () {
                        controller.laundriesListGet.clear();
                        controller.fetchLaundries();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomBotton(
                      text: 'online'.tr,
                      color: Colors.white.withOpacity(0.5),
                      onPress: () {
                        controller.laundriesListGet.clear();
                        controller.fetchLaundriesFilter();
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20 / 2),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Our background
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: AnimationLimiter(
                          child: Obx(
                        () => controller.laundriesListGet.isNotEmpty
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemCount: controller.laundriesListGet.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    delay: const Duration(milliseconds: 100),
                                    child: SlideAnimation(
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration: const Duration(
                                              milliseconds: 2500),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 15),
                                              width: c.maxWidth * 0.8,
                                              height: s * 0.3,
                                              child: Singlelaunds(
                                                  press: () {},
                                                  photo: controller
                                                      .laundriesListGet[index]
                                                      .photo,
                                                  laundryId: controller
                                                      .laundriesListGet[index]
                                                      .id,
                                                  address: controller
                                                      .laundriesListGet[index]
                                                      .address,
                                                  isWork: controller
                                                      .laundriesListGet[index]
                                                      .workOrNot,
                                                  name: controller
                                                      .laundriesListGet[index]
                                                      .name,
                                                  isFavorite: controller
                                                      .laundriesListGet[index]
                                                      .favorite))),
                                    ),
                                  );
                                })
                            : Center(
                                child: Lottie.asset("images/washer.json"),
                              ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
/* class Laundries extends StatelessWidget {
  const Laundries({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _appbar = PreferredSize(
      
        child: AppBar(
          
          backgroundColor: mainColor,
          centerTitle: true,
          
          
        ),
        preferredSize: const Size.fromHeight(0));
    var s = mySize(_appbar);

    return Scaffold(
      appBar: _appbar,
      body: LayoutBuilder(builder: (context, c) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: AnimationLimiter(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 2500),
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              width: c.maxWidth * 0.8,
                              height: s * 0.3,
                              child: SingleLaundry(
                                  category: "1",
                                  press: () {
                                    Get.toNamed(Routes.detailsScreen);
                                  }))),
                    ),
                  );
                }),
          ),
        );
      }),
    );
  }
}
 */