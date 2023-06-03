import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project2/utils/theme.dart';

class LaundInfo extends StatelessWidget {
  const LaundInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AutoSizeText(
              "ALshaalan",
              style: TextStyle(fontSize: 20),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              Icon(
                Icons.circle,
                color: Colors.green,
              ),
              SizedBox(
                width: 5,
              ),
              AutoSizeText(
                "Online",
                style: TextStyle(fontSize: 15),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.location_pin,
                  color: mainColor,
                ),
                SizedBox(
                  width: 5,
                ),
                AutoSizeText(
                  "Damascus,ALhamra street",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star_rate_sharp,
                  color: Colors.yellow[600],
                ),
                const SizedBox(
                  width: 5,
                ),
                const AutoSizeText(
                  "4.3",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Container(
              color: mainColor,
              height: 0.5,
              width: double.maxFinite,
              //margin:const EdgeInsets.symmetric(horizontal: 30),
            )
          ],
        ),
      ),
    );
  }
}
