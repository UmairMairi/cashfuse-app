import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class NativeAdWidget extends StatelessWidget {
  final _controller = NativeAdmobController();
  @override
  Widget build(BuildContext context) {
    return NativeAdmob(
      adUnitID: "ca-app-pub-3940256099942544/2247696110",
      loading: Center(child: CircularProgressIndicator()),
      error: Text("Failed to load the ad"),
      controller: _controller,
      type: NativeAdmobType.full,
      options: NativeAdmobOptions(
        ratingColor: Colors.red,
        showMediaContent: true,
        callToActionStyle: NativeTextStyle(color: Colors.red, backgroundColor: Colors.black),
        headlineTextStyle: NativeTextStyle(
          color: Colors.blue,
        ),

        // Others ...
      ),
    );
  }
}
