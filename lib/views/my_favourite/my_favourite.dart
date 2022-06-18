import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import '../views.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          elevation: 0.15,
          centerTitle: true,
          title: Text(
            'My Favourites',
            style: kTitlePrimary.copyWith(letterSpacing: 0.32),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black45,
            indicatorWeight: 3,
            indicatorColor: kPrimaryButtons,
            labelColor: kPrimaryButtons,
            labelStyle: kTextPrimary.copyWith(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(
                height: 62,
                text: 'Equipments',
              ),
              Tab(
                height: 62,
                text: 'Meeting Room',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Equipments(),
          MeetingRoom(),
        ]),
      ),
    );
  }
}
