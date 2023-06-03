import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/widgets/custom_text.dart';

class SingleLaundry extends StatelessWidget {
  //final ProductModel product;

  const SingleLaundry({
    Key? key,
    required this.name,
    required this.press,
    required this.adress,
    required this.state,required this.photo,
  }) : super(key: key);
  final String name;
  final String adress;
  final int state;
  final String photo;

  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: LayoutBuilder(builder: (context, c) {
        print(c.maxHeight * 0.4);
        // print(c.maxWidth);
        //print(MediaQuery.of(context).size.width);

        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: const Offset(0, 1),
                    blurRadius: 7)
              ]),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: c.maxHeight * 0.6,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://laundries-project.000webhostapp.com/images/laundries/$photo',
                            ),
                            fit: BoxFit.cover)),
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      height: c.maxHeight * 0.19,
                      width: c.maxWidth * 0.19,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: c.maxHeight * 0.4,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: name,
                          size: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_sharp,
                              color: Colors.yellow[600],
                              size: 15,
                            ),
                            const CustomText(
                              text: "4.3",
                              size: 13,
                            )
                          ],
                        ),
                      ],
                    ),
                    ///////

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: mainColor,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: adress,
                          size: 13,
                          color: Colors.grey[600],
                        )
                      ],
                    ),

                    /////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Icon(
                          Icons.circle,
                          color:state==1? Colors.green:Colors.red,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: state == 1? 'online'.tr : 'offline'.tr,
                          size: 13,
                          color: Colors.grey[600],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
