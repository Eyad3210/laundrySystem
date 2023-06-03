import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/logic/controller/complaint_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  var controller = Get.put(ComplaintController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: mainColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 50, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                  name: 'Complaints',
                  icon: Icons.favorite_outline,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => onItemPressed(context, index: 5)),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 3:
        print("kabssss");
        controller.fetchComplaints();
        Get.toNamed(Routes.complaint);
        break;

      case 5:
        Box box = Hive.box("mybox");
        box.clear();
        box.delete("login");
        print("objecttttttttttttttttttttttttttt");
        print(box.get("login"));
        print("objecttttttttttttttttttttttttttt");
        if (box.get("login") == null) {
          Get.offAllNamed(Routes.loginScreen);
        }
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("images/iron2.png"),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('person@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
