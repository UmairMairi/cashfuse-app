// ignore_for_file: must_be_immutable

import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/controllers/imageController.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/widget/customImage.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      return GetBuilder<ImageControlller>(builder: (imageControlller) {
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
                padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Get.theme.primaryColor.withOpacity(0.2),
                          width: 4,
                        ),
                      ),
                      child: imageControlller.imageFile != null && imageControlller.imageFile.path.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                imageControlller.imageFile,
                                fit: BoxFit.cover,
                                // height: 100,
                                // width: 120,
                              ),
                            )
                          : global.currentUser.userImage.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CustomImage(
                                    image: global.appInfo.baseUrls.userImageUrl + '/' + global.currentUser.userImage,
                                    fit: BoxFit.cover,
                                    // height: 150,
                                    // width: 150,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.blue[100],
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 5,
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            CupertinoActionSheet(
                              title: Text(
                                'Select',
                                style: Get.theme.primaryTextTheme.headline6.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              actions: [
                                InkWell(
                                  onTap: () async {
                                    Get.back();
                                    imageControlller.imageService(ImageSource.camera);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Take Picture',
                                      style: Get.theme.primaryTextTheme.subtitle1,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Get.back();
                                    imageControlller.imageService(ImageSource.gallery);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Image from Gallery',
                                      style: Get.theme.primaryTextTheme.subtitle1,
                                    ),
                                  ),
                                ),
                              ],
                              cancelButton: TextButton(
                                child: Text(
                                  'Cancel',
                                  style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.red),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Get.theme.secondaryHeaderColor,
                          radius: 18,
                          child: Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

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
              authController.updateProfile(imageControlller.imageFile);
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
    });
  }
}
