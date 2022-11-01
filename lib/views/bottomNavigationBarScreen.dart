// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/homeScreen.dart';
import 'package:cashbackapp/views/profileScreen.dart';
import 'package:cashbackapp/views/recentClicksScreen.dart';
import 'package:cashbackapp/views/referEarnScreen.dart';
import 'package:cashbackapp/views/searchScreen.dart';
import 'package:flutter/material.dart';
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

  List<String> tabList = [
    'Home',
    'Search',
    'Refer & Earn',
    'Recents Clicks',
    'Profile',
  ];

  List<Widget> _screens() => [
        HomeScreen(),
        SearchScreen(),
        ReferEarnScreen(),
        RecentClickScreen(),
        ProfieScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (navController) {
        return WillPopScope(
          onWillPop: () async {
            if (navController.bottomNavIndex.value != 0) {
              navController.setBottomIndex(0);
              return false;
            } else {
              if (_canExit) {
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
            bottomNavigationBar: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  BottomNavigationBar(
                    backgroundColor: Colors.white,
                    iconSize: 22,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Get.theme.secondaryHeaderColor,
                    unselectedItemColor: Colors.grey[450],
                    currentIndex: navController.bottomNavIndex.value,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    unselectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  Positioned(
                    bottom: 24,
                    child: InkWell(
                      onTap: () {
                        navController.setBottomIndex(2);
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          Images.rupee,
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: _screens().elementAt(navController.bottomNavIndex.value),
          ),
        );
      },
    );
  }
}
