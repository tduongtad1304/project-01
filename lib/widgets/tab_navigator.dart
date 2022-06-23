import 'package:flutter/material.dart';

import '../views/views.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (tabItem == "Home") {
      child = const MyHomePage();
    } else if (tabItem == "My Favourites") {
      child = const MyFavourite();
    } else if (tabItem == "Profile") {
      child = const Profile();
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child!, maintainState: true);
      },
    );
  }
}
