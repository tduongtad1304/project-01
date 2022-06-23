import 'package:flutter/material.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

import '../widgets/tab_navigator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  // PageController _pageController = PageController();

  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "My Favourites", "Profile"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "My Favourites": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        currentIndex = index;
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(
  //     initialPage: currentIndex,
  //     keepPage: true,
  //     viewportFraction: 1,
  //   );
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  // final screens = [
  //   const MyHomePage(),
  //   const MyFavourite(),
  //   const Profile(),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Home"),
          _buildOffstageNavigator("My Favourites"),
          _buildOffstageNavigator("Profile"),
        ]),
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
            color: kNavigationColor[currentIndex],
          ),
        ),
      ),
      child: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectTab(pageKeys[index], index);
            // _pageController.animateToPage(currentIndex,
            //     duration: const Duration(milliseconds: 300),
            //     curve: Curves.easeInOutCubicEmphasized);
          });
        },
        destinations: _bottomTabBar(),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  List<Widget> _bottomTabBar() {
    return [
      CustomBottomTabBar(
          context: context,
          currentIndex: currentIndex,
          pageIndex: 0,
          label: 'Home',
          icon: Icons.home_outlined),
      CustomBottomTabBar(
          context: context,
          currentIndex: currentIndex,
          pageIndex: 1,
          label: 'My Favourites',
          icon: Icons.favorite_border_outlined),
      CustomBottomTabBar(
        context: context,
        currentIndex: currentIndex,
        pageIndex: 2,
        label: 'Profile',
        icon: Icons.person_outline,
      ),
    ];
  }
}

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({
    Key? key,
    required this.context,
    required this.currentIndex,
    required this.pageIndex,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final BuildContext context;
  final int currentIndex;
  final int pageIndex;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        currentIndex == pageIndex
            ? Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 4,
                color: kNavigationColor[pageIndex],
              )
            : Container(),
        NavigationDestination(
          icon: Icon(icon),
          label: label,
          selectedIcon: Icon(
            icon,
            color: kNavigationColor[currentIndex],
          ),
        ),
      ],
    );
  }
}
