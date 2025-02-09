import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/view/screens/TeamUI/EditPtofile.dart';
import 'package:JustTour/view/screens/TeamUI/FollowersList.dart';
import 'package:JustTour/view/screens/TeamUI/TeamHomepage.dart';

class TeamNavbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<TeamNavbar> {
  int _selectedIndex = 0;
  static List<Widget> widgetsList = <Widget>[
    TeamHomepage(),
    FollowersList(),
    EditProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteSmoke,
        ),
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
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.groups,
                text: "Followers",
              ),
              GButton(
                icon: Icons.account_box_outlined,
                text: "Profile",
              ),
            ]),
      ),
      body: widgetsList.elementAt(_selectedIndex),
    );
  }
}
