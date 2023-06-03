import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hive/hive.dart';
import 'package:project2/logic/controller/location.dart';
import 'package:project2/logic/controller/theme_controller.dart';
import 'package:project2/logic/controller/translate_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/services/location_service.dart';
import 'package:project2/utils/theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

MyLocaleController controller = Get.find();
var controller1 = Get.find<Location>();
bool isSwitched = false;
Box box = Hive.box("mybox");
double long = 0;
double lat = 0;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    child: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.black,
                    ),
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Soon",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  /*  const Text(
                    "Programmer",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ), */
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "profile".tr,
                      style: TextStyle(
                        color: Colors.black87,
                        //  fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    listProfile(Icons.person, "username".tr, "-----"),
                    divider(),
                    listProfile(Icons.male, "gender".tr, "-----"),
                    divider(),
                    listProfile(Icons.phone, "phone".tr, "-----"),
                    divider(),
                    GestureDetector(
                        onTap: () {
                          if (box.get("lang") == "ar") {
                            const Locale("en");
                            controller.changeLanguage("en");
                          } else {
                            const Locale("ar");
                            controller.changeLanguage("ar");
                          }
                        },
                        child: listProfile(Icons.language, "lang".tr,
                            box.get("lang") == "ar" ? "العربية" : "English")),
                    divider(),
                 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18),
      height: 1,
      color: Colors.grey,
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: mainColor),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
