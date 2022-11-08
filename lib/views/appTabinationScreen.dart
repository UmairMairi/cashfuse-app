import 'dart:convert';

import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/searchController.dart';
import 'package:cashbackapp/models/allInOneSearchDataModel.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class AppTabinationScreen extends StatefulWidget {
  AppTabinationScreen() : super();
  @override
  _AppTabinationScreenState createState() => new _AppTabinationScreenState();
}

class _AppTabinationScreenState extends State<AppTabinationScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  bool _isDataLoaded = false;
  bool _isWebLoaded = false;

  WebViewController webViewController;
  TextEditingController _cSearch = new TextEditingController();
  var _fDismiss = new FocusNode();

  SearchController searchController = Get.find<SearchController>();

  bool _isDuplicate = false;

  AllInOneSearchDataModel selectedValue;

  _AppTabinationScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
          return false;
        } else {
          Get.find<BottomNavigationController>().setBottomIndex(0);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottomOpacity: 0.0,
            shape: RoundedRectangleBorder(side: BorderSide.none),
            backgroundColor: searchController.addNewTabList2[_currentIndex].tabColor != null && searchController.addNewTabList2[_currentIndex].tabColor.isNotEmpty ? _getColorFromHex(searchController.addNewTabList2[_currentIndex].tabColor) : Get.theme.primaryColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                if (await webViewController.canGoBack()) {
                  webViewController.goBack();
                } else {
                  Get.find<BottomNavigationController>().setBottomIndex(0);
                }
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            titleSpacing: 0,
            title: Container(
              margin: EdgeInsets.only(right: 10),
              height: 37,
              //decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
              child: TextFormField(
                controller: _cSearch,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon:
                      // _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty
                      //     ? InkWell(
                      //         onTap: () async {
                      //           FocusScope.of(context).requestFocus(_fDismiss);
                      //           _cSearch.clear();
                      //           await webViewController.loadUrl(searchController.addNewTabList2[_currentIndex].trackingUrl);
                      //           setState(() {});
                      //         },
                      //         child: Icon(
                      //           Icons.close,
                      //           color: Colors.white,
                      //         ),
                      //       )
                      //     :
                      InkWell(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(_fDismiss);
                      _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty && searchController.addNewTabList2[_currentIndex].searchUrl != null && searchController.addNewTabList2[_currentIndex].searchUrl.isNotEmpty
                          ? await webViewController.loadUrl(searchController.addNewTabList2[_currentIndex].searchUrl + _cSearch.text.trim())
                          : await webViewController.loadUrl(searchController.addNewTabList2[_currentIndex].trackingUrl);
                      _isWebLoaded = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'All in one search',
                  hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                onFieldSubmitted: (String val) async {
                  _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty && searchController.addNewTabList2[_currentIndex].searchUrl != null && searchController.addNewTabList2[_currentIndex].searchUrl.isNotEmpty
                      ? await webViewController.loadUrl(searchController.addNewTabList2[_currentIndex].searchUrl + _cSearch.text.trim())
                      : await webViewController.loadUrl(searchController.addNewTabList2[_currentIndex].trackingUrl);
                  _isWebLoaded = false;
                  setState(() {});
                },
              ),
            ),
            actions: [
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          body: Column(
            children: [
              _isDataLoaded
                  ? searchController.addNewTabList2 != null && searchController.addNewTabList2.length > 0
                      ? Expanded(
                          child: SizedBox(
                            child: tabCreate(),
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Text(
                              'No data found.',
                            ),
                          ),
                        )
                  : Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _tabControllerListener() {
    setState(() {
      _currentIndex = _tabController.index;
      _isWebLoaded = false;
    });
  }

  _init() async {
    try {
      if (global.sp.getString('tabList') != null) {
        List<dynamic> list = json.decode(global.sp.getString('tabList'));
        print(list);

        searchController.addNewTabList2 = List<AllInOneSearchDataModel>.from(list.map((x) => AllInOneSearchDataModel.fromJson(x)));
        _tabController = new TabController(
          length: searchController.addNewTabList2.length,
          vsync: this,
          initialIndex: _currentIndex,
        );
        searchController.addNewTabList.clear();
        searchController.addNewTabList.addAll(searchController.addNewTabList2.where((e) => e.id != null).toList());
        _tabController.addListener(_tabControllerListener);
      } else {
        if (searchController.addNewTabList2 != null && searchController.addNewTabList2.length > 0) {
          // if (searchController.addNewTabList2.length >= 6) {
          //   searchController.addNewTabList2.addAll(searchController.allInOneList.sublist(0, 5));
          // }

          // if (searchController.addNewTabList2.length >= 6) {
          //   searchController.addNewTabList2.insert(
          //     5,
          //     AllInOneSearchDataModel(name: '+Add Tab'),
          //   );
          // }
          _tabController = new TabController(
            length: searchController.addNewTabList2.length,
            vsync: this,
            initialIndex: _currentIndex,
          );
          _tabController.addListener(_tabControllerListener);
        }
      }

      setState(() {
        _isDataLoaded = true;
      });
    } catch (e) {
      print("Exception - apptabinationScreen.dart - _init():" + e.toString());
    }
  }

  tabCreate() {
    return GetBuilder<SearchController>(builder: (controller) {
      return Scaffold(
          backgroundColor: searchController.addNewTabList2[_currentIndex].tabColor != null && searchController.addNewTabList2[_currentIndex].tabColor.isNotEmpty ? _getColorFromHex(searchController.addNewTabList2[_currentIndex].tabColor) : Get.theme.primaryColor,
          //smartAppList[_currentIndex].appHexCode != null ? _getColorFromHex(smartAppList[_currentIndex].appHexCode) : global.defaultColor,
          appBar: _isDataLoaded
              ? TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorWeight: 3,
                  indicatorColor: Colors.white,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).primaryColorLight,
                  onTap: (int index) async {
                    _tabController.animateTo(index, curve: Curves.slowMiddle);
                    setState(() {
                      _isWebLoaded = false;
                    });
                  },
                  tabs: List<Widget>.generate(searchController.addNewTabList2.length, (int index) {
                    return new Tab(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              searchController.addNewTabList2[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 4),
                          //   child: Text(
                          //     'Upto 10% off',
                          //     style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.w300),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }),
                )
              : PreferredSize(
                  preferredSize: Size.zero,
                  child: SizedBox(),
                ),
          body: TabBarView(
            controller: _tabController,
            children: List.generate(searchController.addNewTabList2.length, (index) {
              return searchController.addNewTabList2[index].name == '+Add Tab'
                  ? Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchController.addNewTabList.length,
                              itemBuilder: (context, i) {
                                //searchController.addNewTabList2.removeWhere((element) => element.id == null);
                                return Card(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'TAB ${i + 1}',
                                        style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.black54),
                                      ),
                                      DropdownButton(
                                        items: searchController.allInOneList.map<DropdownMenuItem<AllInOneSearchDataModel>>((AllInOneSearchDataModel value) {
                                          return DropdownMenuItem<AllInOneSearchDataModel>(
                                            value: value,
                                            child: Column(
                                              children: [
                                                Text(
                                                  value.name,
                                                  style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.black54),
                                                ),
                                                Divider(
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          if (searchController.addNewTabList.where((element) => element.name == value.name).toList().length > 0) {
                                            _isDuplicate = true;
                                            setState(() {});
                                          } else {
                                            _isDuplicate = false;
                                            setState(() {});
                                          }

                                          searchController.addNewTabList[i] = value;
                                          //searchController.addNewTabList2.add(value);
                                          setState(() {});
                                        },
                                        underline: SizedBox(),
                                        iconEnabledColor: Get.theme.primaryColor,
                                        iconDisabledColor: Get.theme.primaryColor,
                                        hint: Text(
                                          searchController.addNewTabList[i].name,
                                          style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.black54),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (searchController.addNewTabList.length >= 6) {
                                            //searchController.addNewTabList2.removeWhere((element) => element.id == searchController.addNewTabList[i].id);
                                            searchController.addNewTabList.removeAt(i);
                                            // searchController.addNewTabList2.addAll(searchController.addNewTabList);
                                            // searchController.addNewTabList2.insert(
                                            //   searchController.addNewTabList.length,
                                            //   AllInOneSearchDataModel(name: '+Add Tab'),
                                            // );
                                            setState(() {});
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: 'minimum 5 tabs are reuired.',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (_isDuplicate) {
                                        Fluttertoast.showToast(
                                          msg: 'duplicate tab no allow',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      } else if (searchController.addNewTabList.where((element) => element.id == null).toList().length > 0) {
                                        Fluttertoast.showToast(
                                          msg: 'empty tab not allow',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      } else {
                                        searchController.addNewTabList2.removeWhere((element) => element.id == null);
                                        searchController.addNewTabList2.clear();
                                        searchController.addNewTabList2.addAll(searchController.addNewTabList);
                                        searchController.addNewTabList.clear();
                                        searchController.addNewTabList.addAll(searchController.addNewTabList2);

                                        //global.sp.setString('tabList', searchController.addNewTabList.map((e) => e.toJson()).toString());
                                        searchController.addNewTabList2.insert(
                                          searchController.addNewTabList2.length,
                                          AllInOneSearchDataModel(name: '+Add Tab'),
                                        );
                                        global.sp.setString('tabList', jsonEncode(searchController.addNewTabList2.map((i) => i.toJson()).toList()).toString());

                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => AppTabinationScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 45,
                                      //margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Get.theme.secondaryHeaderColor,
                                        //borderRadius: BorderRadius.circular(5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'SAVE',
                                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      searchController.addNewTab();
                                    },
                                    child: Container(
                                      height: 45,
                                      // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Get.theme.secondaryHeaderColor,
                                        // borderRadius: BorderRadius.circular(5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'ADD NEW TAB',
                                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        searchController.addNewTabList2[index].searchUrl != null && searchController.addNewTabList2[index].searchUrl.isNotEmpty && _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty
                            ? WebView(
                                initialUrl: searchController.addNewTabList2[index].searchUrl + _cSearch.text.trim(),
                                javascriptMode: JavascriptMode.unrestricted,
                                allowsInlineMediaPlayback: true,
                                onWebViewCreated: (controller) {
                                  webViewController = controller;
                                  setState(() {});
                                },
                                onWebResourceError: (error) {
                                  showCustomSnackBar(error.description);
                                },
                                onProgress: (_) {
                                  setState(() {});
                                },
                                onPageFinished: (val) {
                                  _isWebLoaded = true;
                                  setState(() {});
                                },
                              )
                            : WebView(
                                initialUrl: searchController.addNewTabList2[index].trackingUrl,
                                javascriptMode: JavascriptMode.unrestricted,
                                allowsInlineMediaPlayback: true,
                                onWebViewCreated: (controller) {
                                  webViewController = controller;
                                  setState(() {});
                                },
                                onWebResourceError: (error) {
                                  showCustomSnackBar(error.description);
                                },
                                onProgress: (_) {
                                  setState(() {});
                                },
                                onPageFinished: (val) {
                                  _isWebLoaded = true;
                                  setState(() {});
                                },
                              ),
                        _isWebLoaded == false ? CircularProgressIndicator() : SizedBox(),
                      ],
                    );
            }),
          ));
    });
  }

  _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  // Widget _shimmerWidget() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: Shimmer.fromColors(
  //       baseColor: Colors.grey[300],
  //       highlightColor: Colors.grey[100],
  //       child: Text(
  //         'Loading....',
  //         style: Theme.of(context).primaryTextTheme.caption.copyWith(fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }
}
