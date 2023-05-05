// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/paymentController.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cashfuse/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';

class PayPalRedeemScreen extends StatelessWidget {
  final fPayPalId = new FocusNode();
  var payPalId = TextEditingController();

  PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (controller) {
      return Scaffold(
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
            'PayPal Redeem',
            style: Get.theme.primaryTextTheme.titleSmall
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
                        Colors.blue[900],
                        Colors.blue[800],
                        Colors.blue.withOpacity(0.85),
                      ],
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                    semanticContainer: false,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        Images.paypal,
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
                          Text(
                            'Account Details',
                            style: Get.theme.primaryTextTheme.titleMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ).translate(),
                          InkWell(
                            onTap: () {
                              if (paymentController.payPalDetails != null) {
                                payPalId.text =
                                    paymentController.payPalDetails.payPalEmail;
                              }
                              Get.dialog(
                                Dialog(
                                  child: Container(
                                    height: 210,
                                    width: global.getPlatFrom() ? 400 : null,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Add PayPal Account',
                                          style: Get
                                              .theme.primaryTextTheme.titleLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ).translate(),
                                        TextFormField(
                                          focusNode: fPayPalId,
                                          controller: payPalId,
                                          scrollPadding: EdgeInsets.zero,
                                          cursorColor: Get.theme.primaryColor,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            hintText: 'PayPal Email Address',
                                            labelStyle: TextStyle(
                                              color: fPayPalId.hasFocus
                                                  ? Get.theme.primaryColor
                                                  : Colors.grey,
                                            ),
                                            focusColor: Get.theme.primaryColor,
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: fPayPalId.hasFocus
                                                  ? Get.theme.primaryColor
                                                  : Colors.grey,
                                            )),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: fPayPalId.hasFocus
                                                  ? Get.theme.primaryColor
                                                  : Colors.grey,
                                            )),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: fPayPalId.hasFocus
                                                  ? Get.theme.primaryColor
                                                  : Colors.grey,
                                            )),
                                          ),
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(fPayPalId);
                                          },
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (payPalId.text.isNotEmpty) {
                                              Get.back();
                                              paymentController
                                                  .addPayPalDetails(
                                                      payPalId.text.trim());
                                            } else {
                                              showCustomSnackBar(
                                                  'Please enter PayPal Email.');
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
                                            child: Text(
                                              paymentController.payPalDetails !=
                                                      null
                                                  ? 'edit'.toUpperCase()
                                                  : 'add'.toLowerCase() + "+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ).translate(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 8),
                              decoration: BoxDecoration(
                                color: Get.theme.secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                paymentController.payPalDetails != null
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
                      paymentController.payPalDetails != null
                          ? FutureBuilder(
                              future: global.translatedText("PayPal Email: "),
                              builder: (context, snapShot) {
                                return RichText(
                                  text: TextSpan(
                                    text: snapShot.data,
                                    style: Get.theme.primaryTextTheme.titleSmall
                                        .copyWith(
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            " ${paymentController.payPalDetails.payPalEmail}",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall
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
        bottomNavigationBar: paymentController.payPalDetails != null
            ? InkWell(
                onTap: () {
                  paymentController.sendWithdrawalRequest('paypal');
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
                  child: Text(
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
