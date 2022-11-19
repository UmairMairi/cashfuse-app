import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/searchController.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/loginOrSignUpScreen.dart';
import 'package:cashfuse/views/myEarningScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: 80,
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
            Expanded(
              flex: 2,
              child: GetBuilder<SearchController>(builder: (searchController) {
                return Container(
                  //height: 45,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: searchController.searchString,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 25, color: Theme.of(context).disabledColor),
                      hintText: 'What do you want to buy today?',
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (text) {
                      //   _actionSearch(searchController, true);
                      //   showDialog(
                      //     context: context,
                      //     builder: (con) => Dialog(
                      //       insetPadding: EdgeInsets.only(top: 70, bottom: 50, left: 50),
                      //       child: SizedBox(
                      //         width: 550,
                      //         child: WebSearchResultWidget(
                      //           searchText: _searchController.text.trim(),
                      //         ),
                      //       ),
                      //     ),
                      //   );
                    },
                  ),
                );
              }),
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
                child: Text('How It Works'),
              ),
            ),
            VerticalDivider(
              endIndent: 20,
              color: Get.theme.primaryColor,
            ),
            global.currentUser.id != null
                ? InkWell(
                    onTap: () {
                      Get.to(() => LoginOrSignUpScreen(
                            fromMenu: true,
                          ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          Images.payments,
                          height: 25,
                        )),
                  )
                : InkWell(
                    onTap: () {
                      Get.to(() => MyEarningSceen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(AppLocalizations.of(context).login),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        AppConstants.WEB_MAX_WIDTH,
        85,
      );
}
