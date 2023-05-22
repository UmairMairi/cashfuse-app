import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

void showConfirmationDialog(BuildContext context, String title, String content,
    List<CupertinoDialogAction> actions) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: GetPlatform.isWeb
          ? Text(
              title,
            )
          : Text(
              title,
            ).translate(),
      content: GetPlatform.isWeb
          ? Text(
              content,
            )
          : Text(
              content,
            ).translate(),
      actions: actions,
    ),
  );
}
