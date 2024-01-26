import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platable/dummy/_dummy.dart';
import 'package:platable/model/product.dart';
import 'package:platable/screen/productDetail/productDetail.dart';
import 'package:platable/utility/cardWidget.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "/";
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _header(),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [CardWidget(), CardWidget()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Color(0xff4E0079),
          unselectedItemColor: Color(0xff7C747E),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/discovery.svg"),
              label: 'Discovery',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bookmark-gray.svg"),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/user.svg"),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Row(children: [
        SizedBox(
            child: Image(image: AssetImage('assets/logo/app_logo_icon.png'))),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(
                  color: Color(0xff7C747E),
                  fontFamily: 'roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Dubai",
                  style: TextStyle(
                      color: Color(0xff1D1B1E),
                      fontFamily: 'roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 2,
                ),
                SizedBox(
                    child:
                        Image(image: AssetImage("assets/icons/down-arrow.png")))
              ],
            )
          ],
        )
      ]),
    );
  }
}
