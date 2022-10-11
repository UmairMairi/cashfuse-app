// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:astrotalk/controllers/bottomNavigationController.dart';
import 'package:astrotalk/views/callScreen.dart';
import 'package:astrotalk/views/chatScreen.dart';
import 'package:astrotalk/views/historyScreen.dart';
import 'package:astrotalk/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen() : super();

  bool _canExit = GetPlatform.isWeb ? true : false;

  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.ads_click_rounded,
    Icons.person,
  ];

  List<String> tabList = [
    'Home',
    'Search',
    'Recents Clicks',
    'Profile',
  ];

  List<Widget> _screens() => [
        HomeScreen(),
        ChatScreen(),
        CallScreen(),
        HistoryScreen(),
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
              height: 45,
              child: BottomNavigationBar(
                iconSize: 22,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black,
                currentIndex: navController.bottomNavIndex.value,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w300),
                unselectedLabelStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w300),
                items: List.generate(iconList.length, (index) {
                  return BottomNavigationBarItem(
                    icon: Icon(iconList[index]),
                    label: tabList[index],
                  );
                }),
                elevation: 5,
                onTap: (index) {
                  navController.setBottomIndex(index);
                },
              ),
            ),
            body: _screens().elementAt(navController.bottomNavIndex.value),
          ),
        );
      },
    );
  }
}
