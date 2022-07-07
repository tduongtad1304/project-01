import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import '../../widgets/widgets.dart';
import '../views.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> with AutomaticKeepAliveClientMixin<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          elevation: 0.15,
          centerTitle: true,
          title: Text('My Favourites', style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
          bottom: TabBar(
            unselectedLabelColor: Colors.black45,
            indicatorWeight: 3,
            indicatorColor: kPrimaryButtons,
            labelColor: kPrimaryButtons,
            labelStyle: kTextPrimary.copyWith(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(height: 62, text: 'Equipments'),
              Tab(height: 62, text: 'Meeting Room'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyFavouriteEquipments(),
            MyFavouriteMeetingRoom(),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 62,
          height: 62,
          child: FloatingActionButton(
            heroTag: 'my_favourite_fab',
            backgroundColor: kPrimaryButtons,
            onPressed: () {
              Navigator.of(context).push(
                createRoute(const NewBookings()),
              );
            },
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
