import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/loginOrSignUpScreen.dart';
import 'package:cashfuse/views/myEarningScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cashfuse/utils/global.dart' as global;

class WebTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppConstants.WEB_MAX_WIDTH,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                //scaffoldKey.currentState.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  MdiIcons.sortVariant,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            Image.asset(
              Images.cashfuse,
              height: 35,
              // width: 100,
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (global.currentUser.id != null) {
                  Get.to(() => MyEarningSceen());
                } else {
                  Get.to(() => LoginOrSignUpScreen(
                        fromMenu: true,
                      ));
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    Images.payments,
                    height: 25,
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        AppConstants.WEB_MAX_WIDTH,
        kToolbarHeight,
      );
}
