import 'package:flutter/material.dart';
import 'package:flutter_web/theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget navItem(int index, String text) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(left: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: selectedIndex == index
                      ? FontWeight.w600
                      : FontWeight.w300,
                ),
              ),
              Container(
                width: 66,
                height: 2,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Color(0xffFE998D)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'background.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            child: ListView(
              children: [
                // NOTE : Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('logo.png', width: 72),
                    Row(
                      children: [
                        navItem(0, 'Guides'),
                        navItem(1, 'Pricing'),
                        navItem(2, 'Team'),
                        navItem(3, 'Stories'),
                      ],
                    ),
                    Image.asset('btn.png', width: 163),
                  ],
                ),

                // NOTE :  Content
                SizedBox(height: 76),
                Image.asset('bycicle.png', height: 550),

                // NOTE : Footer
                SizedBox(height: 84),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('down.png', width: 24),
                    SizedBox(width: 13),
                    Text(
                      'Scroll to Learn More',
                      style: primaryTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
