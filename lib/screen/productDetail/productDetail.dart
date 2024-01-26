import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platable/model/product.dart';
import 'package:platable/utility/cardWidget.dart';

class ProductDetail extends StatelessWidget {
  static const String name = "/detail";
  Product product;
  List<Map<String, dynamic>> body = [
    {"icon": "assets/icons/storeProductDetails.svg", "name": "Direction"},
    {"icon": "assets/icons/information-circle.svg", "name": "Nutrition Facts"},
    {"icon": "assets/icons/star.svg", "name": "Review"}
  ];
  ProductDetail({required this.product});
  Widget build(BuildContext context) {
    print(product);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          elevation: 1,
          title: Text("Product Details"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage("assets/icons/notification.png"),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage("assets/icons/cart.png"),
              ),
            ),
          ],
        ),
        body: _cardWidget(context),
      ),
    );
  }

  Widget _cardWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 280,
            child: Stack(children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 40,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(product.brandBgColor),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset(
                                    product.brandImage,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(product.brandName,
                                    style: TextStyle(
                                        fontFamily: 'roboto',
                                        color: Colors.white,
                                        fontSize: 22)),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/shield-check.svg",
                                  width: 15,
                                  height: 15,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "assets/icons/bookmark.svg",
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                      ]),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 140,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontFamily: 'roboto',
                              color: Color(0xff1D1B1E),
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              product.status,
                              style: TextStyle(
                                fontFamily: 'roboto',
                                fontSize: 16,
                                color: Color(0xff7C747E),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/clock-circle.svg",
                              width: 15,
                              height: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              product.time,
                              style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 16,
                                  color: Color(0xff7C747E)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              width: 10,
                              height: 10,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.rating,
                              style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 12,
                                  color: Color(0xff7C747E)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/icons/map.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.distance + " km",
                              style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 12,
                                  color: Color(0xff7C747E)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 2, bottom: 2, left: 20, right: 20),
                              child: Text(
                                product.qty + " Left",
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffEA4335),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$" + product.discountedPrice.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1D1B1E),
                                      fontFamily: 'roboto'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$" + product.price.toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 16,
                                      color: Color(0xff7C747E),
                                      fontFamily: 'roboto'),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: -200,
                  child: Container(
                    child: Image(image: AssetImage(product.image)),
                  )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
                "Extra Crisp Romaine, Crumbled Feta, Stacy's® Pita Chips, House-Cooked Chickpeas, Sliced Grape Tomatoes, Overnight Pickled Onion, Sliced Cucumbers"),
          ),
          ...body.map(
            (e) => Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            e['icon'],
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(e['name']),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/icons/direction-right.svg",
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xffF6EFF3),
                  )
                ],
              ),
            ),
          ),
          CardWidget(),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Color(0xffEADFEA))),
              child: Center(
                  child: Text(
                'Add to bag',
                style: TextStyle(
                    color: Color(0xff2F004C),
                    fontSize: 22,
                    fontFamily: 'roboto'),
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
