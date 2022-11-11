import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/accountSettingScreen.dart';
import 'package:cashbackapp/views/allcategoriesScreen.dart';
import 'package:cashbackapp/views/appTabinationScreen.dart';
import 'package:cashbackapp/views/getHelpScreen.dart';
import 'package:cashbackapp/views/getStartedScreen.dart';
import 'package:cashbackapp/views/requestPaymentScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:store_redirect/store_redirect.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: Get.width - 90,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                color: Get.theme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    global.currentUser.id != null
                        ? ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: global.currentUser.userImage.isNotEmpty
                                  ? CustomImage(
                                      image: global.appInfo.baseUrls.userImageUrl + '/' + global.currentUser.userImage,
                                      height: 30,
                                      width: 30,
                                    )
                                  : Image.asset(
                                      Images.malePerson,
                                      height: 30,
                                    ),
                            ),
                            title: Text(
                              global.currentUser.name,
                              style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                            ),
                            subtitle: Text(
                              global.currentUser.email.isNotEmpty ? global.currentUser.email : global.currentUser.phone,
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
                            ),
                          )
                        : Text('Welcome'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pending',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                color: Colors.white,
                                fontSize: 11,
                                letterSpacing: 0,
                              ),
                            ),
                            Text(
                              global.currentUser.earning != null ? '₹${global.currentUser.earning.remEarning}' : '₹0.00',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            // width: 2,
                            // thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Approved',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                color: Colors.white,
                                letterSpacing: 0,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              global.currentUser.earning != null ? '₹${global.currentUser.earning.totalEarnings}' : '₹0.00',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            // width: 2,
                            // thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Redeemed',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                color: Colors.white,
                                letterSpacing: 0,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              global.currentUser.earning != null ? '₹${global.currentUser.earning.sentForWithdrawal}' : '₹0.00',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
                //: Text('Welcome!'),
                ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.home_outlined,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text(
            //           'Home',
            //           style: Get.theme.primaryTextTheme.bodyText1.copyWith(
            //             letterSpacing: 0,
            //             fontWeight: FontWeight.w300,
            //             color: Colors.black.withOpacity(0.6),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => AccountSettingScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'My account',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => AllCategoriesScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.store_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'All Categories',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => RequestPaymentScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.ticket,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Redeem Cashback',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => AppTabinationScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'All in One Search',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.countertops_outlined,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text(
            //           'Missing Cashback',
            //           style: Get.theme.primaryTextTheme.bodyText1.copyWith(
            //             letterSpacing: 0,
            //             fontWeight: FontWeight.w300,
            //             color: Colors.black.withOpacity(0.6),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => GetStartedScreen(
                      fromSplash: false,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'How ${global.appName} works?',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Get.back();
                global.share(global.appName, '');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Share The App',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                StoreRedirect.redirect(
                  androidAppId: 'com.cashback.app',
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_outline_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Rate the App',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(() => GetHelpScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.help_outline_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Get Help',
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.power_settings_new_outlined,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text(
            //           'Logout',
            //           style: Get.theme.primaryTextTheme.bodyText1.copyWith(
            //             letterSpacing: 0,
            //             fontWeight: FontWeight.w300,
            //             color: Colors.black.withOpacity(0.6),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        )
        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       padding: EdgeInsets.only(top: 30),
        //       color: Get.theme.primaryColor,
        //       child: ListTile(
        //         horizontalTitleGap: 0,
        //         leading: Icon(
        //           Icons.home_outlined,
        //           color: Colors.white,
        //         ),
        //         title: Text(
        //           'Home',
        //           style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
        //         ),
        //       ),
        //     ),
        //     ListTile(
        //       onTap: () {
        //         Get.to(() => CategoryScreen());
        //       },
        //       horizontalTitleGap: 0,
        //       leading: Icon(
        //         Icons.store_outlined,
        //         color: Get.theme.iconTheme.color,
        //       ),
        //       title: Text(
        //         'Higest Cashback Stores',
        //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
        //       ),
        //     ),
        //     ListTile(
        //       onTap: () {
        //         Get.to(() => RetailerCategoryScreen());
        //       },
        //       horizontalTitleGap: 0,
        //       leading: Icon(
        //         Icons.edit_calendar_sharp,
        //         color: Get.theme.iconTheme.color,
        //       ),
        //       title: Text(
        //         'Retailers By Category',
        //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
        //       ),
        //       trailing: Icon(
        //         Icons.arrow_forward_ios,
        //         size: 15,
        //       ),
        //     ),
        //     ListTile(
        //       horizontalTitleGap: 0,
        //       leading: Icon(
        //         Icons.volume_down_outlined,
        //         color: Get.theme.iconTheme.color,
        //       ),
        //       title: Text(
        //         'Top Product Deals',
        //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
        //       ),
        //       trailing: Icon(
        //         Icons.arrow_forward_ios,
        //         size: 15,
        //       ),
        //     ),
        //     Divider(),
        //     InkWell(
        //       onTap: () {
        //         Get.to(() => AppWiseOfferShowListScreen());
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         child: Row(
        //           children: [
        //             Icon(
        //               Icons.man,
        //               color: Colors.black.withOpacity(0.7),
        //             ),
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Text(
        //               'Men Fashion',
        //               style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
        //                 letterSpacing: -0.5,
        //                 fontWeight: FontWeight.w300,
        //                 color: Colors.black.withOpacity(0.7),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         Get.to(() => AppWiseOfferShowListScreen());
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         child: Row(
        //           children: [
        //             Icon(
        //               Icons.woman_outlined,
        //               color: Colors.black.withOpacity(0.7),
        //             ),
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Text(
        //               'Women Fashion',
        //               style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
        //                 letterSpacing: -0.5,
        //                 fontWeight: FontWeight.w300,
        //                 color: Colors.black.withOpacity(0.7),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         Get.to(() => AppWiseOfferShowListScreen());
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         child: Row(
        //           children: [
        //             Icon(
        //               Icons.man,
        //               color: Colors.black.withOpacity(0.7),
        //             ),
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Text(
        //               'Men Shoes',
        //               style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
        //                 letterSpacing: -0.5,
        //                 fontWeight: FontWeight.w300,
        //                 color: Colors.black.withOpacity(0.7),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         Get.to(() => AppWiseOfferShowListScreen());
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         child: Row(
        //           children: [
        //             Icon(
        //               Icons.woman_outlined,
        //               color: Colors.black.withOpacity(0.7),
        //             ),
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Text(
        //               'Women Shoes',
        //               style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
        //                 letterSpacing: -0.5,
        //                 fontWeight: FontWeight.w300,
        //                 color: Colors.black.withOpacity(0.7),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
