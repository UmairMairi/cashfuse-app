import 'package:flutter/cupertino.dart';
import 'package:google_translator/google_translator.dart';

void showConfirmationDialog(BuildContext context, String title, String content,
    List<CupertinoDialogAction> actions) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        title,
      ).translate(),
      content: Text(
        content,
      ).translate(),
      actions: actions,
    ),
  );
}
