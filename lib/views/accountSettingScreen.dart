import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingScreen extends StatelessWidget {
  final fnameFocus = new FocusNode();
  final femailFocus = new FocusNode();
  final cPasswordFocus = new FocusNode();
  final newPasswordFocus = new FocusNode();
  final conPasswordFocus = new FocusNode();

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (auth) {
      authController.name.text = global.currentUser.name;
      authController.email.text = global.currentUser.email;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            'Account Settings',
            style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   color: Get.theme.primaryColor,
            //   child: TabBar(
            //     controller: commonController.tabController,
            //     indicatorColor: Colors.white,
            //     labelColor: Colors.white,
            //     unselectedLabelColor: Colors.white,
            //     onTap: (index) => commonController.setTabIndex(index),
            //     tabs: [
            //       Tab(
            //         text: 'Personal Details',
            //       ),
            //       Tab(
            //         text: 'Change Password',
            //       )
            //     ],
            //   ),
            // ),
            // commonController.tabController.index == 0
            //     ?
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                  TextFormField(
                    focusNode: fnameFocus,
                    controller: authController.name,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Test User',
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fnameFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fnameFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fnameFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    focusNode: femailFocus,
                    controller: authController.email,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'test@gmail.com',
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: femailFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: femailFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: femailFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                  ),
                  // Text(
                  //   'test@gmail.com',
                  //   style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 5),
                  //   child: DottedLine(
                  //     dashLength: 1,
                  //     lineThickness: 1.5,
                  //     dashGapLength: 1.5,
                  //     dashColor: Colors.grey,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mobile Number',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${global.currentUser.phone}',
                    //style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DottedLine(
                      dashLength: 1,
                      lineThickness: 1.5,
                      dashGapLength: 1.5,
                      dashColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         'Receive email when I get referral earning',
                  //       ),
                  //     ),
                  //     Switch(
                  //       thumbColor: MaterialStateProperty.all(
                  //         Colors.white,
                  //       ),
                  //       value: true,
                  //       onChanged: (val) {},
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
            // : SizedBox(),
            // StatefulBuilder(
            //     builder: (BuildContext context, StateSetter setState) => Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           TextFormField(
            //             focusNode: cPasswordFocus,
            //             scrollPadding: EdgeInsets.zero,
            //             cursorColor: Get.theme.primaryColor,
            //             decoration: InputDecoration(
            //               contentPadding: EdgeInsets.zero,
            //               labelText: 'Current Password',
            //               labelStyle: TextStyle(
            //                 color: cPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               ),
            //               focusColor: Get.theme.primaryColor,
            //               focusedBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: cPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               border: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: cPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               enabledBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: cPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               suffixIcon: Icon(
            //                 Icons.visibility_off_rounded,
            //                 color: Colors.grey,
            //               ),
            //             ),
            //             onTap: () {
            //               //FocusScope.of(context).unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
            //               FocusScope.of(context).requestFocus(cPasswordFocus);
            //               setState(() {});
            //             },
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           TextFormField(
            //             focusNode: newPasswordFocus,
            //             scrollPadding: EdgeInsets.zero,
            //             cursorColor: Get.theme.primaryColor,
            //             decoration: InputDecoration(
            //               contentPadding: EdgeInsets.zero,
            //               labelText: 'New Password',
            //               labelStyle: TextStyle(
            //                 color: newPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               ),
            //               focusColor: Get.theme.primaryColor,
            //               focusedBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: newPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               border: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: newPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               enabledBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: newPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               suffixIcon: Icon(
            //                 Icons.visibility_off_rounded,
            //                 color: Colors.grey,
            //               ),
            //             ),
            //             onTap: () {
            //               FocusScope.of(context).requestFocus(newPasswordFocus);
            //               setState(() {});
            //             },
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           TextFormField(
            //             focusNode: conPasswordFocus,
            //             scrollPadding: EdgeInsets.zero,
            //             cursorColor: Get.theme.primaryColor,
            //             decoration: InputDecoration(
            //               contentPadding: EdgeInsets.zero,
            //               labelText: 'Confirm Password',
            //               labelStyle: TextStyle(
            //                 color: conPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               ),
            //               focusColor: Get.theme.primaryColor,
            //               focusedBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: conPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               border: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: conPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               enabledBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(
            //                 color: conPasswordFocus.hasFocus ? Get.theme.primaryColor : Colors.grey,
            //               )),
            //               suffixIcon: Icon(
            //                 Icons.visibility_off_rounded,
            //                 color: Colors.grey,
            //               ),
            //             ),
            //             onTap: () {
            //               FocusScope.of(context).requestFocus(conPasswordFocus);
            //               setState(() {});
            //             },
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
          ],
        ),
        bottomSheet: InkWell(
          onTap: () {
            authController.updateProfile();
          },
          child: Container(
            height: 40,
            width: Get.width,
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'SAVE CHANGES',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    });
  }
}
