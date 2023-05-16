// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/imageController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/confirmationDialog.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_number/phone_number.dart';

class AccountSettingScreen extends StatelessWidget {
  final fnameFocus = new FocusNode();
  final femailFocus = new FocusNode();
  final fnumberFocus = new FocusNode();
  final cPasswordFocus = new FocusNode();
  final newPasswordFocus = new FocusNode();
  final conPasswordFocus = new FocusNode();

  AuthController authController = Get.find<AuthController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final countryPicker = FlCountryCodePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (auth) {
      return GetBuilder<ImageControlller>(builder: (imageControlller) {
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          drawer: global.getPlatFrom() ? DrawerWidget() : null,
          appBar: global.getPlatFrom()
              ? WebTopBarWidget(
                  scaffoldKey: scaffoldKey,
                )
              : AppBar(
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
                    style: Get.theme.primaryTextTheme.titleLarge
                        .copyWith(color: Colors.white),
                  ).translate(),
                ),
          body: Center(
            child: Container(
              alignment: Alignment.topCenter,
              color: global.getPlatFrom() ? Colors.white : Colors.transparent,
              width: global.getPlatFrom()
                  ? AppConstants.WEB_MAX_WIDTH / 2
                  : AppConstants.WEB_MAX_WIDTH,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
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
                            child: imageControlller.imageFile != null &&
                                    imageControlller.imageFile.path.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: GetPlatform.isWeb
                                        ? Image.network(
                                            imageControlller.imageFile.path)
                                        : Image.file(
                                            imageControlller.imageFile,
                                            fit: BoxFit.cover,
                                            // height: 100,
                                            // width: 120,
                                          ),
                                  )
                                : global.currentUser.userImage != null &&
                                        global.currentUser.userImage.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: CustomImage(
                                          image: global.appInfo.baseUrls
                                                  .userImageUrl +
                                              '/' +
                                              global.currentUser.userImage,
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
                                      style: Get
                                          .theme.primaryTextTheme.titleLarge
                                          .copyWith(
                                        color: Colors.grey,
                                      ),
                                    ).translate(),
                                    actions: [
                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          imageControlller
                                              .imageService(ImageSource.camera);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            'Take Picture',
                                            style: Get.theme.primaryTextTheme
                                                .titleMedium,
                                          ).translate(),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          imageControlller.imageService(
                                              ImageSource.gallery);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            'Image from Gallery',
                                            style: Get.theme.primaryTextTheme
                                                .titleMedium,
                                          ).translate(),
                                        ),
                                      ),
                                    ],
                                    cancelButton: TextButton(
                                      child: Text(
                                        'Cancel',
                                        style: Get
                                            .theme.primaryTextTheme.titleMedium
                                            .copyWith(color: Colors.red),
                                      ).translate(),
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
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ).translate(),
                          TextFormField(
                            focusNode: fnameFocus,
                            controller: authController.name,
                            scrollPadding: EdgeInsets.zero,
                            cursorColor: Get.theme.primaryColor,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Test User',
                              hintStyle: Get.theme.primaryTextTheme.bodySmall
                                  .copyWith(color: Colors.grey[400]),
                              focusColor: Get.theme.primaryColor,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnameFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnameFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnameFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email Address',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ).translate(),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: femailFocus,
                            controller: authController.email,
                            readOnly: global.currentUser.email != null &&
                                    global.currentUser.email.isNotEmpty
                                ? true
                                : false,
                            scrollPadding: EdgeInsets.zero,
                            cursorColor: Get.theme.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: 'test@gmail.com',
                              hintStyle: Get.theme.primaryTextTheme.bodySmall
                                  .copyWith(color: Colors.grey[400]),
                              focusColor: Get.theme.primaryColor,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: femailFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: femailFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: femailFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ).translate(),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: authController.contactNo,
                            cursorColor: Get.theme.primaryColor,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: '9999999999',
                              hintStyle: Get.theme.primaryTextTheme.bodySmall
                                  .copyWith(color: Colors.grey[400]),
                              focusColor: Get.theme.primaryColor,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnumberFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnumberFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: fnumberFocus.hasFocus
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              )),
                              prefixIcon: InkWell(
                                onTap: () async {
                                  final code = await countryPicker.showPicker(
                                    context: context,
                                  );
                                  if (code != null) {
                                    authController.coutryCode = code.dialCode;
                                    authController.update();
                                  }
                                },
                                child: Container(
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Text(
                                    authController.coutryCode,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // TextFormField(
                          //   focusNode: fnumberFocus,
                          //   controller: authController.contactNo,
                          //   readOnly: global.currentUser.phone != null &&
                          //           global.currentUser.phone.isNotEmpty
                          //       ? true
                          //       : false,
                          //   scrollPadding: EdgeInsets.zero,
                          //   cursorColor: Get.theme.primaryColor,
                          //   textInputAction: TextInputAction.done,
                          //   keyboardType: TextInputType.numberWithOptions(
                          //       signed: true, decimal: true),
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //   ],
                          //   decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.zero,
                          //     hintText: '9999999999',
                          //     hintStyle: Get.theme.primaryTextTheme.bodySmall
                          //         .copyWith(color: Colors.grey[400]),
                          //     focusColor: Get.theme.primaryColor,
                          //     focusedBorder: UnderlineInputBorder(
                          //         borderSide: BorderSide(
                          //       color: fnumberFocus.hasFocus
                          //           ? Get.theme.primaryColor
                          //           : Colors.grey,
                          //     )),
                          //     border: UnderlineInputBorder(
                          //         borderSide: BorderSide(
                          //       color: fnumberFocus.hasFocus
                          //           ? Get.theme.primaryColor
                          //           : Colors.grey,
                          //     )),
                          //     enabledBorder: UnderlineInputBorder(
                          //         borderSide: BorderSide(
                          //       color: fnumberFocus.hasFocus
                          //           ? Get.theme.primaryColor
                          //           : Colors.grey,
                          //     )),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    !GetPlatform.isWeb
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                showConfirmationDialog(
                                  context,
                                  'Delete My Account',
                                  'Are you sure you want to delete Account ?',
                                  [
                                    CupertinoDialogAction(
                                      child: Text(
                                        'Yes',
                                        style: Get
                                            .theme.primaryTextTheme.titleSmall
                                            .copyWith(color: Colors.red),
                                      ).translate(),
                                      onPressed: () {
                                        authController.removeUserfromDb();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: Text(
                                        'No',
                                        style: Get
                                            .theme.primaryTextTheme.titleSmall
                                            .copyWith(color: Colors.blue),
                                      ).translate(),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Delete My Account',
                                      style: Get
                                          .theme.primaryTextTheme.bodyMedium
                                          .copyWith(
                                        letterSpacing: -0.5,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  String _numberWithCountryCode =
                      authController.coutryCode + authController.contactNo.text;
                  bool _isValid = GetPlatform.isAndroid ? false : true;
                  if (GetPlatform.isAndroid) {
                    try {
                      PhoneNumber phoneNumber =
                          await PhoneNumberUtil().parse(_numberWithCountryCode);
                      _numberWithCountryCode = '+' +
                          phoneNumber.countryCode +
                          phoneNumber.nationalNumber;
                      _isValid = true;
                    } catch (e) {
                      print(
                          "Exception - LoginWithPhoneScreen.dart - PhoneNumberUtil():" +
                              e.toString());
                    }
                  }
                  if (!_isValid) {
                    showCustomSnackBar('Invalid phone number');
                  } else {
                    await authController
                        .updateProfile(imageControlller.imageFile);
                  }
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    width: global.getPlatFrom()
                        ? AppConstants.WEB_MAX_WIDTH / 2
                        : Get.width,
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
                      style: Get.theme.primaryTextTheme.titleSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ).translate(),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
