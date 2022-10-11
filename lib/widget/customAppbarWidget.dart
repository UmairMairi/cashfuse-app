import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onBackPressed;
  final List<Widget> actions;
  final Color bgColor;
  final TextStyle titleStyle;
  CustomAppBar({@required this.title, this.bgColor, this.onBackPressed, this.actions, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: Icon(
        Icons.menu,
        color: Get.theme.iconTheme.color,
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
