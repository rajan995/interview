import 'package:flutter/material.dart';

class Product {
  String image;
  String name;
  String brandName;
  String brandImage;
  int brandNameColor;
  int brandBgColor;
  String status;
  String time;
  String rating;
  String distance;
  String qty;
  int qtyBtnColor;
  int price;
  int discountedPrice;

  Product(
      {required this.image,
      required this.name,
      required this.brandName,
      required this.brandImage,
      required this.brandNameColor,
      required this.brandBgColor,
      required this.status,
      required this.time,
      required this.rating,
      required this.distance,
      required this.qty,
      required this.qtyBtnColor,
      required this.price,
      required this.discountedPrice});
  factory Product.toMap(Map<String, dynamic> map) {
    return Product(
        image: map['image'],
        name: map['name'],
        brandName: map['brandName'],
        brandImage: map['brandName'],
        brandNameColor: map['brandNameColor'],
        brandBgColor: map['brandBgColor'],
        status: map['status'],
        time: map['time'],
        rating: map['rating'],
        distance: map['distance'],
        qty: map['qty'],
        qtyBtnColor: map['qtyBtnColor'],
        price: map['price'],
        discountedPrice: map['discountedPrice']);
  }
}
