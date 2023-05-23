import 'package:flutter/material.dart';
import 'package:cashfuse/utils/global.dart' as global;

class TranslationTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  TranslationTextWidget(
      {required this.text,
      this.style,
      this.maxLines,
      this.textAlign,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: global.translatedText(text),
      builder: (context, snapshot) {
        return Text(
          snapshot.data != null ? snapshot.data! : '',
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          style: style != null ? style! : null,
        );
      },
    );
  }
}
