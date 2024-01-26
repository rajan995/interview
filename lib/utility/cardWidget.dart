import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:platable/dummy/_dummy.dart';
import 'package:platable/model/product.dart';
import 'package:platable/screen/productDetail/productDetail.dart';

class CardWidget extends StatelessWidget {
  List<Product> data = dataSource;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended for you",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1D1B1E)),
          ),
          Container(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10, bottom: 5),
              children: [
                ...data.map((Product product) => _cardWidget(context, product)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWidget(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, ProductDetail.name, arguments: product),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 100,
        width: 190,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 1.0,
          //   ),
          // ]
        ),
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
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 5.0,
                  //   ),
                  // ]
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/bookmark.svg",
                            width: 30,
                            height: 30,
                          )
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            (product.brandImage),
                            width: 20,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(product.brandName,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/shield-check.svg",
                          width: 15,
                          height: 15,
                        ),
                      ],
                    )
                  ]),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 140,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 10,
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(color: Color(0xff1D1B1E)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          product.status,
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff7C747E)),
                        ),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SvgPicture.asset(
                          "assets/icons/clock-circle.svg",
                          width: 15,
                          height: 15,
                        ),
                        Text(
                          product.time,
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff7C747E)),
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
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff7C747E)),
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
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff7C747E)),
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
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEA4335),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$" + product.discountedPrice.toString(),
                              style: TextStyle(
                                  fontSize: 10,
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
                                  fontSize: 8,
                                  color: Color(0xff7C747E),
                                  fontFamily: 'roboto'),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: -180,
              child: Container(
                child: Image(image: AssetImage(product.image)),
              )),
        ]),
      ),
    );
  }
}
