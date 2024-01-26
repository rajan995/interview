import 'package:flutter/material.dart';
import 'package:platable/model/product.dart';
import 'package:platable/screen/home/home.screen.dart';
import 'package:platable/screen/login/login.screen.dart';
import 'package:platable/screen/productDetail/productDetail.dart';
import 'package:platable/screen/splash/splash.screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.name:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case LoginScreen.name:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case HomeScreen.name:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case ProductDetail.name:
      Product product = (settings.arguments as Product);
      return MaterialPageRoute(builder: (_) => ProductDetail(product: product));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
