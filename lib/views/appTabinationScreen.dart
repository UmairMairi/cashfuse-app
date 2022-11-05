import 'package:cashbackapp/controllers/searchController.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppTabinationScreen extends StatefulWidget {
  final List<dynamic> smartAppList;
  AppTabinationScreen({a, o, this.smartAppList}) : super();
  @override
  _AppTabinationScreenState createState() => new _AppTabinationScreenState(this.smartAppList);
}

class _AppTabinationScreenState extends State<AppTabinationScreen> with SingleTickerProviderStateMixin {
  List<dynamic> smartAppList;
  TabController _tabController;
  int _currentIndex = 0;
  bool _isDataLoaded = false;
  bool _isWebLoaded = false;
  GlobalKey<ScaffoldState> _scaffoldKey;
  WebViewController controller;
  TextEditingController _cSearch = new TextEditingController();
  var _fDismiss = new FocusNode();

  SearchController searchController = Get.find<SearchController>();

  _AppTabinationScreenState(this.smartAppList) : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          Navigator.of(context).pop();
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottomOpacity: 0.0,
            shape: RoundedRectangleBorder(side: BorderSide.none),
            backgroundColor: Get.theme.primaryColor,
            //smartAppList[_currentIndex].appHexCode != null ? _getColorFromHex(smartAppList[_currentIndex].appHexCode) : global.defaultColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                } else {
                  Navigator.of(context).pop();
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
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(_fDismiss);
                      _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty && smartAppList[_currentIndex].appSearchLink != null && smartAppList[_currentIndex].appSearchLink.isNotEmpty
                          ? await controller.loadUrl(smartAppList[_currentIndex].appSearchLink + _cSearch.text.trim())
                          : await controller.loadUrl(smartAppList[_currentIndex].appLink);
                      _isDataLoaded = false;
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
                  _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty && smartAppList[_currentIndex].appSearchLink != null && smartAppList[_currentIndex].appSearchLink.isNotEmpty
                      ? await controller.loadUrl(smartAppList[_currentIndex].appSearchLink + _cSearch.text.trim())
                      : await controller.loadUrl(smartAppList[_currentIndex].appLink);
                  _isDataLoaded = false;
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
                  ? searchController.allInOneList != null && searchController.allInOneList.length > 0
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
      await searchController.allInOneSearch();
      if (searchController.allInOneList != null && searchController.allInOneList.length > 0) {
        _tabController = new TabController(length: searchController.allInOneList.length, vsync: this, initialIndex: _currentIndex);
        _tabController.addListener(_tabControllerListener);
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
          backgroundColor: Get.theme.primaryColor,
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
                  tabs: List<Widget>.generate(searchController.allInOneList.length, (int index) {
                    return new Tab(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              searchController.allInOneList[index].name,
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
            children: List.generate(searchController.allInOneList.length, (index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // smartAppList[index].appSearchLink != null && smartAppList[index].appSearchLink.isNotEmpty && _cSearch.text.trim() != null && _cSearch.text.trim().isNotEmpty
                  //     ? WebView(
                  //         initialUrl: smartAppList[index].appSearchLink + _cSearch.text.trim(),
                  //         javascriptMode: JavascriptMode.unrestricted,
                  //         allowsInlineMediaPlayback: true,
                  //         onWebViewCreated: (controller) {
                  //           this.controller = controller;
                  //           setState(() {});
                  //         },
                  //         onWebResourceError: (error) {
                  //           showCustomSnackBar(error.description);
                  //         },
                  //         onProgress: (_) {
                  //           setState(() {});
                  //         },
                  //         onPageFinished: (val) {
                  //           _isDataLoaded = true;
                  //           setState(() {});
                  //         },
                  //       )
                  //     :
                  WebView(
                    initialUrl: searchController.allInOneList[index].trackingUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    allowsInlineMediaPlayback: true,
                    onWebViewCreated: (controller) {
                      this.controller = controller;
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
