import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';
import '../repositories/login_repository.dart';
import '../services/login_services.dart';
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
      child = RepositoryProvider(
        create: (context) => LoginRepository(loginServices: LoginServices()),
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            loginRepository: context.read<LoginRepository>(),
          ),
          child: const Profile(),
        ),
      );
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!, maintainState: true);
      },
    );
  }
}
