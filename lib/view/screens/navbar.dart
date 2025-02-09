import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/screens/Trips/AllTrips%20(2).dart';
import 'package:terez/view/screens/homePage/homepage.dart';
import 'package:terez/view/screens/Places/placesScreen.dart';
import 'package:terez/view/screens/Teams/teamsScreen.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static List<Widget> widgetsList = <Widget>[
    HomePage(),
    AllTrips(),
    PlacesScreen(),
    teamsScreen()
  ];

  String translation(String word) {
    return word.tr;
  }

  @override
  Widget build(BuildContext context) {
    print(Get.find<GlobalStateController>().getToken());
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.whiteSmoke,
        child: GNav(
            backgroundColor: AppColors.whiteSmoke,
            tabBackgroundColor: AppColors.midnightGreen,
            color: AppColors.blackCurrant,
            hoverColor: AppColors.blackCurrant,
            activeColor: AppColors.whiteSmoke,
            gap: 8,
            padding: const EdgeInsets.all(12),
            tabMargin: const EdgeInsets.all(6),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 30,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home".tr,
              ),
              GButton(
                icon: Icons.travel_explore_rounded,
                text: "Trips".tr,
              ),
              GButton(
                icon: Icons.place_outlined,
                text: "Places".tr,
              ),
              GButton(
                icon: Icons.people_alt_outlined,
                text: "Teams".tr,
              ),
            ]),
      ),
      body: widgetsList.elementAt(_selectedIndex),
    );
  }
}
