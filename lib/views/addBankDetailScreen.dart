// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/paymentController.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/widget/addBankAccountDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';

class AddPaymentDetailScreen extends StatelessWidget {
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
            'Bank Transfer Redeem',
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
                  //padding: EdgeInsets.symmetric(horizontal: 70, vertical: 28),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //     Images.Amazon_pay,
                    //   ),
                    //   fit: BoxFit.contain,
                    //   scale: 20,
                    // ),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple[800]!,
                        Colors.purple[800]!,
                        Colors.purple.withOpacity(0.85),
                      ],
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                    semanticContainer: false,
                    child: Image.asset(
                      Images.bank,
                      width: 50,
                      height: 30,
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
                            style: Get.theme.primaryTextTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ).translate(),
                          InkWell(
                            onTap: () {
                              Get.dialog(
                                Dialog(
                                  child: AddBankAccountDialog(),
                                  insetPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
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
                                paymentController.bankDetails != null
                                    ? 'edit'.toUpperCase()
                                    : 'add'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ).translate(),
                            ),
                          ),
                        ],
                      ),
                      paymentController.bankDetails != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                    future:
                                        global.translatedText("Holder Name: "),
                                    builder: (context, snapShot) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: snapShot.data,
                                            style: Get.theme.primaryTextTheme
                                                .titleSmall!
                                                .copyWith(
                                              letterSpacing: -0.2,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    " ${paymentController.bankDetails!.acHolderName}",
                                                style: Get.theme
                                                    .primaryTextTheme.bodySmall!
                                                    .copyWith(
                                                  letterSpacing: -0.2,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                FutureBuilder(
                                    future:
                                        global.translatedText("Account No: "),
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
                                                  " ${paymentController.bankDetails!.acNo}",
                                              style: Get.theme.primaryTextTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                letterSpacing: -0.2,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                FutureBuilder(
                                    future:
                                        global.translatedText("Bank Name: "),
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
                                                  " ${paymentController.bankDetails!.bankName}",
                                              style: Get.theme.primaryTextTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                letterSpacing: -0.2,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                FutureBuilder(
                                    future:
                                        global.translatedText("IFSC Code: "),
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
                                              text: " ${paymentController
                                                  .bankDetails!.ifsc}",
                                              style: Get.theme.primaryTextTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                letterSpacing: -0.2,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: paymentController.bankDetails != null
            ? InkWell(
                onTap: () {
                  paymentController.sendWithdrawalRequest('bank');
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
