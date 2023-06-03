import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousol extends StatelessWidget {
  const Carousol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding:
              const EdgeInsets.only( left: 15, right: 15,top: 15,),
          child: CarouselSlider(
            

              items: <Widget>[
                Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      image: const DecorationImage(
                          image: AssetImage(
                            "images/c1.png",
                          ),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      image: const DecorationImage(
                          image: AssetImage(
                            "images/c2.png",
                          ),
                          fit: BoxFit.cover)),
                ),
             
                
              ],
              options: CarouselOptions(
                
                height: 130,
              //  aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeIn,
                enlargeCenterPage: true,

                //onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                
              )),
        );
      },
    );
  }
}
