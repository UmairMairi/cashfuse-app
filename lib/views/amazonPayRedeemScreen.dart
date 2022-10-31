import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmazonPayRedeemScreen extends StatelessWidget {
  final fContactNo = new FocusNode();

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
          'Amazon Pay Redeem',
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
                      Colors.green[800],
                      Colors.green[800],
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
                                child: Container(
                                  height: 200,
                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      Text(
                                        'Add Amazon Account',
                                        style: Get.theme.primaryTextTheme.headline6.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      TextFormField(
                                        focusNode: fContactNo,
                                        scrollPadding: EdgeInsets.zero,
                                        cursorColor: Get.theme.primaryColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'Mobile Number',
                                          labelStyle: TextStyle(
                                            color: fContactNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                                          ),
                                          focusColor: Get.theme.primaryColor,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: fContactNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                                          )),
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: fContactNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                                          )),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: fContactNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                                          )),
                                        ),
                                        onTap: () {
                                          //FocusScope.of(context).unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
                                          FocusScope.of(context).requestFocus(fContactNo);
                                        },
                                      ),
                                      Container(
                                        height: 45,
                                        width: Get.width / 3,
                                        margin: EdgeInsets.only(top: 30),
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
                                    ],
                                  ),
                                ),
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
