

import 'package:flutter/material.dart';
import 'package:project2/utils/theme.dart';

class LaundServices extends StatefulWidget {
  const LaundServices({ Key? key }) : super(key: key);
  

  @override
  State<LaundServices> createState() => _LaundServicesState();
}
bool isExpanded=true;
String services ="Services";


class _LaundServicesState extends State<LaundServices> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return   SliverToBoxAdapter(
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(
                  horizontal: isExpanded ? 30 : 10,
                  vertical: 20,
                ),
                //padding: const EdgeInsets.all(15),
                height: isExpanded ? size.height*0.09 : size.height*0.5,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1200),
                decoration: BoxDecoration(
                 // color: const Color(0xff6F12E8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(isExpanded ? 50 : 0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            services,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                            child: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: size.height*0.04,
                            ),
                          ),
                        ],
                      ),
                      isExpanded
                          ? const SizedBox()
                          : const SizedBox(height: 20),
                      AnimatedCrossFade(
                        firstChild: const Text(
                          '',
                          style: TextStyle(
                            fontSize: 0,
                          ),
                        ),
                        secondChild: Text(
                          services,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 1200),
                        reverseDuration: Duration.zero,
                        sizeCurve: Curves.fastLinearToSlowEaseIn,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}