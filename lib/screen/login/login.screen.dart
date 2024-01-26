import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:platable/screen/home/home.screen.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "/login";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Positioned(
            right: 0,
            top: 0,
            child: Image(image: AssetImage('assets/images/login_bg.png')),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 130,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(15),
                      topLeft: const Radius.circular(15)),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 220,
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xff8636BB),
                    borderRadius: const BorderRadius.only(
                        topRight: const Radius.circular(15),
                        topLeft: const Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hey there, welcome back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign in to continue with your email, facebook or google account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xffE3B5FF), fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            GoogleSignIn _googleSignin = GoogleSignIn();
                            try {
                              GoogleSignInAccount? result =
                                  await _googleSignin.signIn();
                              if (result != null) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, HomeScreen.name, (route) => false);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Login Failed"),
                                ));
                              }
                            } catch (err) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Login Failed"),
                              ));
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Image(
                                  image:
                                      AssetImage('assets/icons/google.png'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Need to create an account?",
                          style:
                              TextStyle(color: Color(0xffE3B5FF), fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
              top: 60,
              right: 0,
              left: 0,
              child: SvgPicture.asset('assets/icons/Pic_Menu.svg')),
          Positioned(
              top: 180,
              right: 0,
              left: 0,
              child: SvgPicture.asset('assets/icons/platable.svg')),
        ]),
      ),
    );
  }
}
