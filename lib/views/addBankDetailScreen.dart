import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/addBankAccountDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentDetailScreen extends StatelessWidget {
  final fnameFocus = new FocusNode();
  final cPasswordFocus = new FocusNode();
  final newPasswordFocus = new FocusNode();
  final conPasswordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
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
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
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
                      Colors.purple[800],
                      Colors.purple[800],
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Account Details',
                          style: Get.theme.primaryTextTheme.subtitle1.copyWith(fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(
                              Dialog(
                                child: AddBankAccountDialog(),
                                insetPadding: EdgeInsets.symmetric(horizontal: 15),
                              ),
                            );
                          },
                          child: Container(
                            height: 45,
                            //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                            decoration: BoxDecoration(
                              color: Get.theme.secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'ADD +',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: InkWell(
      //   onTap: () {},
      //   child: Container(
      //     width: Get.width,
      //     height: 45,
      //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      //     padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      //     decoration: BoxDecoration(
      //       color: Get.theme.secondaryHeaderColor,
      //       borderRadius: BorderRadius.circular(5),
      //     ),
      //     alignment: Alignment.center,
      //     child: Text(
      //       'Continue',
      //       style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      //     ),
      //   ),
      // ),
    );
  }
}
