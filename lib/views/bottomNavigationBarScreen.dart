// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/views/allInOneSearchScreen.dart';
import 'package:cashbackapp/views/homeScreen.dart';
import 'package:cashbackapp/views/profileScreen.dart';
import 'package:cashbackapp/views/recentClicksScreen.dart';
import 'package:cashbackapp/views/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen() : super();

  bool _canExit = GetPlatform.isWeb ? true : false;

  List<Widget> iconList = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.abc),
    Icon(Icons.light_mode_outlined),
    Icon(Icons.person),
  ];

  List<Widget> _screens() => [
        HomeScreen(),
        SearchScreen(),
        AllInOneSearchScreen(),
        RecentClickScreen(),
        ProfieScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    List<String> tabList = [
      AppLocalizations.of(context).home,
      AppLocalizations.of(context).search,
      AppLocalizations.of(context).bottom_allInOne,
      AppLocalizations.of(context).recents_clicks,
      AppLocalizations.of(context).profile,
    ];
    return GetBuilder<BottomNavigationController>(
      builder: (navController) {
        return WillPopScope(
          onWillPop: () async {
            if (navController.bottomNavIndex.value != 0) {
              navController.setBottomIndex(0);
              return false;
            } else {
              if (_canExit) {
                SystemNavigator.pop();
                return true;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Back press again to exit from app', style: TextStyle(color: Colors.white)),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                  margin: EdgeInsets.all(10),
                ));
                _canExit = true;

                Timer(Duration(seconds: 2), () {
                  _canExit = false;
                });
                return false;
              }
            }
          },
          child: Scaffold(
            bottomNavigationBar: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 60,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    iconSize: 22,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Get.theme.secondaryHeaderColor,
                    unselectedItemColor: Colors.grey[450],
                    currentIndex: navController.bottomNavIndex.value,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedLabelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      textBaseline: TextBaseline.ideographic,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                    items: List.generate(iconList.length, (index) {
                      return BottomNavigationBarItem(
                        icon: iconList[index],
                        label: tabList[index],
                      );
                    }),
                    elevation: 5,
                    onTap: (index) {
                      navController.setBottomIndex(index);
                    },
                  ),
                ),
                Positioned(
                  bottom: 28,
                  child: InkWell(
                    onTap: () {
                      navController.setBottomIndex(2);
                    },
                    child: Card(
                        elevation: 2,
                        color: navController.bottomNavIndex.value == 2 ? Get.theme.secondaryHeaderColor : Colors.white,
                        margin: EdgeInsets.only(bottom: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.screen_search_desktop_outlined,
                            color: navController.bottomNavIndex.value == 2 ? Colors.white : Colors.grey[450],
                          ),
                        )),
                  ),
                ),
              ],
            ),
            body: _screens().elementAt(navController.bottomNavIndex.value),
          ),
        );
      },
    );
  }
}
