import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0.15,
        centerTitle: true,
        title: Text(
          'My Favourites',
          style: kTitlePrimary.copyWith(letterSpacing: 0.32),
        ),
      ),
      body: const Center(
        child: Text('My Favourite'),
      ),
    );
  }
}
