import 'package:flutter/material.dart';
import 'package:platable/routes.dart';
import 'package:platable/screen/home/home.screen.dart';
import 'package:platable/screen/productDetail/productDetail.dart';
import 'package:platable/screen/splash/splash.screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'platable',
      initialRoute: SplashScreen.name,
      onGenerateRoute: generateRoute,
    );
  }
}
