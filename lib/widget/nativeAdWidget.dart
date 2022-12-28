import 'package:cashfuse/controllers/adController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdWidget extends StatefulWidget {
  final Color bgColor;
  NativeAdWidget({this.bgColor}) : super();
  @override
  _NativeAdWidgetState createState() => new _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd _myNative;
  AdController adController = Get.put(AdController());
  bool admobNativeAdLoaded = false;

  @override
  Widget build(BuildContext context) {
    _init();
    return GetBuilder<AdController>(builder: (adController) {
      return adController.admobNativeAdLoaded
          ? Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: AdWidget(
                key: UniqueKey(),
                ad: _myNative,
              ))
          : SizedBox();
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    //_myNative.dispose();
    super.dispose();
  }

  Future _init() async {
    try {
      if (global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList.length > 0) {
      } else {
        await Get.find<AdController>().getAdmobSettings();
      }
      await loadNativeAd();
    } catch (e) {
      print("Exception - NativeAdWidget.dart - _init():" + e.toString());
    }
  }

  Future loadNativeAd() async {
    try {
      final NativeAdListener listener = NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          admobNativeAdLoaded = true;
          setState(() {});
          print('+++++++++++++++++++Ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          //ad.dispose();
          setState(() {});
          print('Ad failed to load:++++++++ $error');
        },
        onAdWillDismissScreen: (ad) {
          //ad.dispose();
          admobNativeAdLoaded = false;
          setState(() {});
          print('+++++++++++++++++++Ad dissmiss.');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {
          print('+++++++++++++++++++Ad opened.');
          admobNativeAdLoaded = true;
          setState(() {});
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('+++++++++++++++++Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {
          //setNativeAdLoaded(true);
          admobNativeAdLoaded = true;
          setState(() {});
        },
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (Ad ad) => print('+++++++++++++Ad clicked.'),
      );

      // const String viewType = '<platform-view-type>';
      // // Pass parameters to the platform side.
      // final Map<String, dynamic> creationParams = <String, dynamic>{};

      // AndroidView(
      //   viewType: viewType,
      //   layoutDirection: TextDirection.ltr,
      //   creationParams: creationParams,
      //   creationParamsCodec: const StandardMessageCodec(),
      // );

      _myNative = new NativeAd(
          adUnitId: 'ca-app-pub-3940256099942544/2247696110',
          factoryId: 'adFactoryExample',
          request: AdRequest(),
          listener: listener,
          nativeAdOptions: NativeAdOptions(
            shouldRequestMultipleImages: true,
          ));
      setState(() {});
      _myNative.load();
      setState(() {});
    } catch (e) {
      print("Exception - HomeScreen.dart - _loadNativeAd():" + e.toString());
    }
  }
}
