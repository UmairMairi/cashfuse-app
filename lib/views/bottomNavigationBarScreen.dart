// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cashfuse/controllers/localizationController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/allInOneSearchScreen.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:cashfuse/views/profileScreen.dart';
import 'package:cashfuse/views/recentClicksScreen.dart';
import 'package:cashfuse/views/searchScreen.dart';
import 'package:cashfuse/views/webScreen/webProfileMobileView.dart';
import 'package:cashfuse/views/webScreen/webSearchScreen.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:translator/translator.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  int? pageIndex;
  BottomNavigationBarScreen({this.pageIndex}) : super();
  @override
  _BottomNavigationBarScreenState createState() =>
      new _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  bool _canExit = global.getPlatFrom() ? true : false;
  int? bottomNavIndex;

  bool _isHomeIndex = false;
  bool _isSearchIndex = false;
  bool _isAllInOneIndex = false;
  bool _isRecentClickIndex = false;
  bool _isProfileIndex = false;

  CircularBottomNavigationController? navigationController;

  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.screen_search_desktop_outlined,
    Icons.light_mode_outlined,
    Icons.person,
  ];

  List<Color> colorList = [
    Color(0xFF138DF5),
    Color(0xFFFF9600),
    Color(0xFFBCCBD9),
    Color(0xFFFE5030),
    Color(0xFF00A8D5),
  ];

  List<Widget> _screens() => [
        HomeScreen(
          bgColor: colorList[bottomNavIndex!],
        ),
        GetPlatform.isWeb ? WebSearchScreen() : SearchScreen(),
        AllInOneSearchScreen(
            // bgColor: colorList[bottomNavIndex!],
            ),
        RecentClickScreen(),
        GetPlatform.isWeb ? WebProfileMobileView() : ProfileScreen(),
      ];

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future _init() async {
    try {
      if (widget.pageIndex != null) {
        bottomNavIndex = widget.pageIndex;
      } else {
        bottomNavIndex = 0;
      }
      setState(() {});
      navigationController = CircularBottomNavigationController(bottomNavIndex);
      setState(() {});
    } catch (e) {
      print("Exception - BottomNavigationBarScreen.dart - _init():" +
          e.toString());
    }
  }

  List<String> tabList = [
    'Home',
    'Search',
    'All in one\n Search',
    'Recents Clicks',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (bottomNavIndex != 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BottomNavigationBarScreen(
                pageIndex: 0,
              ),
            ),
          );
          return false;
        } else {
          if (_canExit) {
            SystemNavigator.pop();
            return true;
          } else {
            !GetPlatform.isWeb
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Back press again to exit from app',
                            style: TextStyle(color: Colors.white))
                        .translate(),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                    margin: EdgeInsets.all(10),
                  ))
                : SizedBox();
            _canExit = true;

            Timer(Duration(seconds: 2), () {
              _canExit = false;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: colorList[bottomNavIndex!],
          ),
        ),
        bottomNavigationBar: global.getPlatFrom()
            ? SizedBox()
            : GetBuilder<LocalizationController>(
                builder: (localizationController) => Container(
                  color: Colors.grey[200],
                  child: CircularBottomNavigation(
                      List.generate(iconList.length, (index) {
                        final translator = GoogleTranslator();
                        if (index == 0) {
                          if (_isHomeIndex == false) {
                            Future.delayed(Duration.zero).then((value) {
                              translator
                                  .translate(tabList[index],
                                      to: localizationController.languageCode)
                                  .then(
                                (value) {
                                  tabList[index] = value.text;
                                  setState(() {});
                                },
                              );
                            });
                            _isHomeIndex = true;
                          }

                          return TabItem(
                            iconList[index],
                            tabList[index],
                            colorList[index],
                            labelStyle: TextStyle(
                              color: colorList[index],
                              height: 1.2,
                              fontSize: 12,
                            ),
                          );
                        } else if (index == 1) {
                          if (_isSearchIndex == false) {
                            Future.delayed(Duration.zero).then((value) {
                              translator
                                  .translate(tabList[index],
                                      to: localizationController.languageCode)
                                  .then(
                                (value) {
                                  tabList[index] = value.text;
                                  setState(() {});
                                },
                              );
                            });
                            _isSearchIndex = true;
                          }
                          return TabItem(
                            iconList[index],
                            tabList[index],
                            colorList[index],
                            labelStyle: TextStyle(
                              color: colorList[index],
                              height: 1.2,
                              fontSize: 12,
                            ),
                          );
                        } else if (index == 2) {
                          if (_isAllInOneIndex == false) {
                            Future.delayed(Duration.zero).then((value) {
                              translator
                                  .translate(tabList[index],
                                      to: localizationController.languageCode)
                                  .then(
                                (value) {
                                  tabList[index] = value.text;
                                  setState(() {});
                                },
                              );
                            });

                            _isAllInOneIndex = true;
                          }
                          return TabItem(
                            iconList[index],
                            tabList[index],
                            colorList[index],
                            labelStyle: TextStyle(
                              color: colorList[index],
                              height: 1.2,
                              fontSize: 12,
                            ),
                          );
                        } else if (index == 3) {
                          if (_isRecentClickIndex == false) {
                            Future.delayed(Duration.zero).then((value) {
                              translator
                                  .translate(tabList[index],
                                      to: localizationController.languageCode)
                                  .then(
                                (value) {
                                  tabList[index] = value.text;
                                  setState(() {});
                                },
                              );
                            });

                            _isRecentClickIndex = true;
                          }
                          return TabItem(
                            iconList[index],
                            tabList[index],
                            colorList[index],
                            labelStyle: TextStyle(
                              color: colorList[index],
                              height: 1.2,
                              fontSize: 12,
                            ),
                          );
                        } else {
                          if (_isProfileIndex == false) {
                            Future.delayed(Duration.zero).then((value) {
                              translator
                                  .translate(tabList[index],
                                      to: localizationController.languageCode)
                                  .then(
                                (value) {
                                  tabList[index] = value.text;
                                  setState(() {});
                                },
                              );
                            });

                            _isProfileIndex = true;
                          }
                          return TabItem(
                            iconList[index],
                            tabList[index],
                            colorList[index],
                            labelStyle: TextStyle(
                              color: colorList[index],
                              height: 1.2,
                              fontSize: 12,
                            ),
                          );
                        }
                      }),

                      // List.generate(iconList.length, (index) {
                      //   // final translator = GoogleTranslator();

                      //   if (index == bottomNavIndex) {
                      //     if (!_isHomeIndex) {
                      //       Timer.periodic(Duration.zero, (timer) async {
                      //         if (index == bottomNavIndex) {
                      //           _label =
                      //               await global.translatedText(tabList[index]);
                      //           setState(() {});
                      //         }
                      //       });
                      //     }

                      //     return TabItem(
                      //       iconList[index],
                      //       _label,
                      //       colorList[index],
                      //       labelStyle: TextStyle(
                      //         color: colorList[index],
                      //         height: 1.2,
                      //         fontSize: 12,
                      //       ),
                      //     );
                      //   } else {
                      //     return TabItem(
                      //       iconList[index],
                      //       tabList[index],
                      //       colorList[index],
                      //       labelStyle: TextStyle(
                      //         color: colorList[index],
                      //         height: 1.2,
                      //         fontSize: 12,
                      //       ),
                      //     );
                      //   }
                      //   //  else if (index == 1) {
                      //   //   if (!_isSearchIndex) {
                      //   //     translator
                      //   //         .translate(tabList[index],
                      //   //             to: Get.find<LocalizationController>()
                      //   //                 .languageCode)
                      //   //         .then(
                      //   //       (value) {
                      //   //         setState(() {
                      //   //           tabList[index] = value.text;
                      //   //           _isSearchIndex = true;
                      //   //         });
                      //   //       },
                      //   //     );
                      //   //   }

                      //   //   return TabItem(
                      //   //     iconList[index],
                      //   //     tabList[index],
                      //   //     colorList[index],
                      //   //     labelStyle: TextStyle(
                      //   //       color: colorList[index],
                      //   //       height: 1.2,
                      //   //       fontSize: 12,
                      //   //     ),
                      //   //   );
                      //   // } else if (index == 2) {
                      //   //   if (!_isAllInOneIndex) {
                      //   //     translator
                      //   //         .translate(tabList[index],
                      //   //             to: Get.find<LocalizationController>()
                      //   //                 .languageCode)
                      //   //         .then(
                      //   //       (value) {
                      //   //         setState(() {
                      //   //           tabList[index] = value.text;
                      //   //           _isAllInOneIndex = true;
                      //   //         });
                      //   //       },
                      //   //     );
                      //   //   }

                      //   //   return TabItem(
                      //   //     iconList[index],
                      //   //     tabList[index],
                      //   //     colorList[index],
                      //   //     labelStyle: TextStyle(
                      //   //       color: colorList[index],
                      //   //       height: 1.2,
                      //   //       fontSize: 12,
                      //   //     ),
                      //   //   );
                      //   // } else if (index == 3) {
                      //   //   if (!_isRecentClickIndex) {
                      //   //     translator
                      //   //         .translate(tabList[index],
                      //   //             to: Get.find<LocalizationController>()
                      //   //                 .languageCode)
                      //   //         .then(
                      //   //       (value) {
                      //   //         setState(() {
                      //   //           tabList[index] = value.text;
                      //   //           _isRecentClickIndex = true;
                      //   //         });
                      //   //       },
                      //   //     );
                      //   //   }

                      //   //   return TabItem(
                      //   //     iconList[index],
                      //   //     tabList[index],
                      //   //     colorList[index],
                      //   //     labelStyle: TextStyle(
                      //   //       color: colorList[index],
                      //   //       height: 1.2,
                      //   //       fontSize: 12,
                      //   //     ),
                      //   //   );
                      //   // } else if (index == 4) {
                      //   //   if (!_isProfileIndex) {
                      //   //     translator
                      //   //         .translate(tabList[index],
                      //   //             to: Get.find<LocalizationController>()
                      //   //                 .languageCode)
                      //   //         .then(
                      //   //       (value) {
                      //   //         setState(() {
                      //   //           tabList[index] = value.text;
                      //   //           _isProfileIndex = true;
                      //   //         });
                      //   //       },
                      //   //     );
                      //   //   }

                      //   //   return TabItem(
                      //   //     iconList[index],
                      //   //     tabList[index],
                      //   //     colorList[index],
                      //   //     labelStyle: TextStyle(
                      //   //       color: colorList[index],
                      //   //       height: 1.2,
                      //   //       fontSize: 12,
                      //   //     ),
                      //   //   );
                      //   // } else {
                      //   //   return TabItem(
                      //   //     iconList[index],
                      //   //     tabList[index],
                      //   //     colorList[index],
                      //   //     labelStyle: TextStyle(
                      //   //       color: colorList[index],
                      //   //       height: 1.2,
                      //   //       fontSize: 12,
                      //   //     ),
                      //   //   );
                      //   // }

                      //   // return TabItem(
                      //   //   iconList[index],
                      //   //   tabList[index],
                      //   //   colorList[index],
                      //   //   labelStyle: TextStyle(
                      //   //     color: colorList[index],
                      //   //     height: 1.2,
                      //   //     fontSize: 12,
                      //   //   ),
                      //   // );
                      // }),

                      circleSize: 50,
                      iconsSize: 25,
                      barHeight: 50,
                      normalIconColor: Colors.grey,
                      selectedIconColor: Colors.white,
                      controller: navigationController,
                      selectedPos: bottomNavIndex!,
                      barBackgroundColor: Colors.white,
                      animationDuration: Duration(milliseconds: 300),
                      selectedCallback: (int? selectedPos) async {
                    bottomNavIndex = selectedPos;
                    setState(() {});
                    if (bottomNavIndex == 0) {
                      _isHomeIndex = false;
                    } else if (bottomNavIndex == 1) {
                      _isSearchIndex = false;
                    } else if (bottomNavIndex == 2) {
                      _isAllInOneIndex = false;
                    } else if (bottomNavIndex == 3) {
                      _isRecentClickIndex = false;
                    } else {
                      _isProfileIndex = false;
                    }

                    setState(() {});
                    global.showInterstitialAd();
                  }),
                ),
              ),
        body: _screens().elementAt(bottomNavIndex!),
      ),
    );
  }
}
