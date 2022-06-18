import 'package:flutter/material.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';
import 'package:nsg_biolab_clone/views/views.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final screens = [
    const MyHomePage(),
    const MyFavourite(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: screens[index],
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
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: const Color.fromARGB(20, 121, 107, 107),
        height: 66,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.all(
          kTextPrimary.copyWith(
            fontSize: 12,
            color: kNavigationColor[index],
          ),
        ),
      ),
      child: NavigationBar(
        animationDuration: const Duration(milliseconds: 700),
        selectedIndex: index,
        onDestinationSelected: (int index) {
          setState(() {
            this.index = index;
          });
        },
        destinations: _bottomTabBar(),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }

  List<Widget> _bottomTabBar() {
    return [
      Stack(
        children: [
          index == 0
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 4,
                  color: kNavigationColor[0],
                )
              : Container(),
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home_outlined,
              color: kNavigationColor[index],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          index == 1
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 4,
                  color: kNavigationColor[1],
                )
              : Container(),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border_outlined),
            label: 'Favourites',
            selectedIcon: Icon(
              Icons.favorite_border_outlined,
              color: kNavigationColor[index],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          index == 2
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 4,
                  color: kNavigationColor[2],
                )
              : Container(),
          NavigationDestination(
            icon: const Icon(Icons.person_outline_outlined),
            label: 'Profile',
            selectedIcon: Icon(
              Icons.person_outline_outlined,
              color: kNavigationColor[index],
            ),
          ),
        ],
      ),
    ];
  }
}
