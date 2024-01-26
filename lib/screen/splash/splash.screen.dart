import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:platable/screen/home/home.screen.dart';
import 'package:platable/screen/login/login.screen.dart';

class SplashScreen extends StatelessWidget {
  static const String name = "/splash";
  Widget build(BuildContext context) {
    homeScreen(context);
    return Scaffold(
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            child: Image(image: AssetImage('assets/logo/logo.png'))),
      ),
    );
  }

  homeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    GoogleSignIn _googleSignin = GoogleSignIn();
    if (await _googleSignin.isSignedIn()) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.name, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.name, (route) => false);
    }
  }
}
