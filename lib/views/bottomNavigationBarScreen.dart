// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cashfuse/controllers/bottomNavigationController.dart';
import 'package:cashfuse/views/allInOneSearchScreen.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:cashfuse/views/profileScreen.dart';
import 'package:cashfuse/views/recentClicksScreen.dart';
import 'package:cashfuse/views/searchScreen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
    Icon(Icons.screen_search_desktop_outlined),
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
    return GetBuilder<BottomNavigationController>(
      builder: (navController) {
        return WillPopScope(
          onWillPop: () async {
            if (navController.bottomNavIndex.value != 0) {
              navController.setBottomIndex(0);
              return false;
            } else if (navController.bottomNavIndex.value == 0 && Get.isDialogOpen) {
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
            bottomNavigationBar: StyleProvider(
              style: Style(),
              child: ConvexAppBar(
                //height: 60,
                backgroundColor: Get.theme.primaryColor,
                activeColor: Colors.white,
                color: Get.theme.secondaryHeaderColor,
                //top: -10,
                //curveSize: 70,

                style: TabStyle.fixedCircle,

                items: [
                  TabItem(
                    icon: Icon(
                      Icons.home,
                      color: navController.bottomNavIndex.value == 0 ? Colors.white : Get.theme.secondaryHeaderColor,
                    ),
                    title: AppLocalizations.of(context).home,
                  ),
                  TabItem(
                    icon: Icon(
                      Icons.search,
                      color: navController.bottomNavIndex.value == 1 ? Colors.white : Get.theme.secondaryHeaderColor,
                    ),
                    title: AppLocalizations.of(context).search,
                  ),
                  TabItem(
                      icon: Icon(
                        Icons.screen_search_desktop_outlined,
                        color: Get.theme.primaryColor,
                      ),
                      title: AppLocalizations.of(context).bottom_allInOne),
                  TabItem(
                      icon: Icon(
                        Icons.light_mode_outlined,
                        color: navController.bottomNavIndex.value == 3 ? Colors.white : Get.theme.secondaryHeaderColor,
                      ),
                      title: AppLocalizations.of(context).recent_click),
                  TabItem(
                      icon: Icon(
                        Icons.person,
                        color: navController.bottomNavIndex.value == 4 ? Colors.white : Get.theme.secondaryHeaderColor,
                      ),
                      title: AppLocalizations.of(context).profile),
                ],
                onTap: (int i) {
                  navController.setBottomIndex(i);
                },
              ),
            ),
            // Stack(
            //   alignment: Alignment.topCenter,
            //   clipBehavior: Clip.none,
            //   children: [
            //     SizedBox(
            //       height: 60,
            //       child: BottomNavigationBar(
            //         backgroundColor: Colors.white,
            //         iconSize: 22,
            //         type: BottomNavigationBarType.fixed,
            //         selectedItemColor: Get.theme.secondaryHeaderColor,
            //         unselectedItemColor: Colors.grey[450],
            //         currentIndex: navController.bottomNavIndex.value,
            //         showSelectedLabels: true,
            //         showUnselectedLabels: true,
            //         selectedLabelStyle: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.w400,
            //           height: 1.3,
            //           textBaseline: TextBaseline.ideographic,
            //         ),
            //         unselectedLabelStyle: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.w400,
            //           height: 1.3,
            //         ),
            //         items: List.generate(iconList.length, (index) {
            //           return BottomNavigationBarItem(
            //             icon: iconList[index],
            //             label: tabList[index],
            //           );
            //         }),
            //         elevation: 5,
            //         onTap: (index) {
            //           navController.setBottomIndex(index);
            //         },
            //       ),
            //     ),
            //     Positioned(
            //       bottom: 28,
            //       child: InkWell(
            //         onTap: () {
            //           navController.setBottomIndex(2);
            //         },
            //         child: Card(
            //             elevation: 2,
            //             color: navController.bottomNavIndex.value == 2 ? Get.theme.secondaryHeaderColor : Colors.white,
            //             margin: EdgeInsets.only(bottom: 6),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Icon(
            //                 Icons.screen_search_desktop_outlined,
            //                 color: navController.bottomNavIndex.value == 2 ? Colors.white : Colors.grey[450],
            //               ),
            //             )),
            //       ),
            //     ),
            //   ],
            // ),
            body: _screens().elementAt(navController.bottomNavIndex.value),
          ),
        );
      },
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String fontFamily) {
    return TextStyle(
      fontSize: 11,
      color: color,
      fontFamily: fontFamily,
      textBaseline: TextBaseline.alphabetic,
      height: 1.8,
    );
  }
}
