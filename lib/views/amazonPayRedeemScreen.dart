// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/paymentController.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:cashfuse/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';
import 'package:phone_number/phone_number.dart';

class AmazonPayRedeemScreen extends StatelessWidget {
  final fContactNo = new FocusNode();
  var contactNo = TextEditingController();

  PaymentController paymentController = Get.find<PaymentController>();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (controller) {
      return Scaffold(
        appBar: global.getPlatFrom()
            ? null
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
                title: GetPlatform.isWeb
                    ? Text(
                        'Amazon Pay Redeem',
                        style: Get.theme.primaryTextTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      )
                    : Text(
                        'Amazon Pay Redeem',
                        style: Get.theme.primaryTextTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      ).translate(),
              ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        Colors.green[800]!,
                        Colors.green[800]!,
                        Colors.green.withOpacity(0.85),
                      ],
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                    semanticContainer: false,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        Images.Amazon_pay,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetPlatform.isWeb
                              ? Text(
                                  'Account Details',
                                  style: Get.theme.primaryTextTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                )
                              : Text(
                                  'Account Details',
                                  style: Get.theme.primaryTextTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).translate(),
                          InkWell(
                            onTap: () async {
                              if (paymentController.amazonDetails != null &&
                                  paymentController.amazonDetails!.amazonNo !=
                                      null) {
                                if (GetPlatform.isAndroid) {
                                  try {
                                    PhoneNumber phoneNumber =
                                        await PhoneNumberUtil().parse(
                                            paymentController
                                                .amazonDetails!.amazonNo!);
                                    authController.coutryCode =
                                        '+' + phoneNumber.countryCode;
                                    contactNo.text = phoneNumber.nationalNumber;
                                  } catch (e) {
                                    print(
                                        "Exception - AmazonPayRedeemScreen.dart - PhoneNumberUtil():" +
                                            e.toString());
                                  }
                                }
                              }
                              Get.dialog(
                                Dialog(
                                  child: StatefulBuilder(
                                    builder: (BuildContext context,
                                            StateSetter setState) =>
                                        Container(
                                      width: global.getPlatFrom() ? 400 : null,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GetPlatform.isWeb
                                              ? Text(
                                                  'Add Amazon Account',
                                                  style: Get
                                                      .theme
                                                      .primaryTextTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )
                                              : Text(
                                                  'Add Amazon Account',
                                                  style: Get
                                                      .theme
                                                      .primaryTextTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ).translate(),
                                          TextFormField(
                                            controller: contactNo,
                                            focusNode: fContactNo,
                                            scrollPadding: EdgeInsets.zero,
                                            cursorColor: Get.theme.primaryColor,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                            ],
                                            textAlign: TextAlign.start,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              hintText: 'Mobile Number',
                                              prefixIcon: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  authController.coutryCode!,
                                                ),
                                              ),
                                              labelStyle: TextStyle(
                                                color: fContactNo.hasFocus
                                                    ? Get.theme.primaryColor
                                                    : Colors.grey,
                                              ),
                                              focusColor:
                                                  Get.theme.primaryColor,
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                color: fContactNo.hasFocus
                                                    ? Get.theme.primaryColor
                                                    : Colors.grey,
                                              )),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: fContactNo.hasFocus
                                                    ? Get.theme.primaryColor
                                                    : Colors.grey,
                                              )),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                color: fContactNo.hasFocus
                                                    ? Get.theme.primaryColor
                                                    : Colors.grey,
                                              )),
                                            ),
                                            onTap: () {
                                              FocusScope.of(context)
                                                  .requestFocus(fContactNo);
                                              setState(() {});
                                            },
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (contactNo.text.isNotEmpty) {
                                                Get.back();
                                                paymentController
                                                    .addAmazonPayDetails(
                                                        authController
                                                                .coutryCode! +
                                                            contactNo.text
                                                                .trim());
                                              } else {
                                                showCustomSnackBar(
                                                    'Please add Number.');
                                              }
                                            },
                                            child: Container(
                                              height: 45,
                                              width: Get.width / 3,
                                              margin: EdgeInsets.only(top: 30),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 7, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Get
                                                    .theme.secondaryHeaderColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: GetPlatform.isWeb
                                                  ? Text(
                                                      paymentController
                                                                  .amazonDetails !=
                                                              null
                                                          ? 'edit'.toUpperCase()
                                                          : 'add'.toUpperCase() +
                                                              '+',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  : Text(
                                                      paymentController
                                                                  .amazonDetails !=
                                                              null
                                                          ? 'edit'.toUpperCase()
                                                          : 'add'.toUpperCase() +
                                                              '+',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ).translate(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 8),
                              decoration: BoxDecoration(
                                color: Get.theme.secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: GetPlatform.isWeb
                                  ? Text(
                                      paymentController.amazonDetails != null
                                          ? 'edit'.toUpperCase()
                                          : 'add'.toUpperCase() + '+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      paymentController.amazonDetails != null
                                          ? 'edit'.toUpperCase()
                                          : 'add'.toUpperCase() + '+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ).translate(),
                            ),
                          ),
                        ],
                      ),
                      paymentController.amazonDetails != null
                          ? FutureBuilder(
                              future: global.translatedText("Phone No: "),
                              builder: (context, snapShot) {
                                return RichText(
                                  text: TextSpan(
                                    text: snapShot.data,
                                    style: Get
                                        .theme.primaryTextTheme.titleSmall!
                                        .copyWith(
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            " ${paymentController.amazonDetails!.amazonNo!}",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall!
                                            .copyWith(
                                          letterSpacing: -0.2,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: paymentController.amazonDetails != null
            ? InkWell(
                onTap: () {
                  paymentController.sendWithdrawalRequest('amazon');
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  decoration: BoxDecoration(
                    color: Get.theme.secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: GetPlatform.isWeb
                      ? Text(
                          'Send Withdrawal Request',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Send Withdrawal Request',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ).translate(),
                ),
              )
            : SizedBox(),
      );
    });
  }
}
