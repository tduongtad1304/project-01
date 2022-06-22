import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';

import '../../widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Equipments equipments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
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
    );
  }
}
