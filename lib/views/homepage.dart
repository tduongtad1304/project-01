import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

import '../widgets/widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          elevation: 0.7,
          centerTitle: true,
          title: Text(
            'NSG Biolab',
            style: kTitlePrimary.copyWith(letterSpacing: 0.32),
          ),
        ),
        body: Stack(
          children: [
            CustomTriangle(
              rotate: 180,
              offset: const Offset(1, -1),
              angle: 90,
              a: 277,
              b: 167,
              color: const Color.fromARGB(220, 251, 235, 240),
            ),
            CustomTriangle(
              rotate: 90,
              offset: const Offset(-1, -1),
              angle: 90,
              a: 241,
              b: 277,
              color: const Color.fromARGB(210, 229, 248, 242),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'You have no active bookings',
                    style: kTitlePrimary.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Click the',
                      style: kTextPrimary.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(
                      'assets/images/coolicon.svg',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'below to add new bookings',
                      style: kTextPrimary.copyWith(fontSize: 15),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        floatingActionButton: SizedBox(
          width: 62,
          height: 62,
          child: FloatingActionButton(
            backgroundColor: kPrimaryButton,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.tealAccent,
            labelTextStyle: MaterialStateProperty.all(
              kTextPrimary.copyWith(fontSize: 12),
            ),
          ),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favourties'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
