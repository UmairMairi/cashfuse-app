import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBankAccountDialog extends StatelessWidget {
  final fName = new FocusNode();
  final fAccountNo = new FocusNode();
  final fBankName = new FocusNode();
  final fIfscCode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      padding: EdgeInsets.symmetric(vertical: 20),
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
            'Add Bank Account',
            style: Get.theme.primaryTextTheme.headline6.copyWith(fontWeight: FontWeight.w600),
          ),

          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    focusNode: fName,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Holder Name',
                      labelStyle: TextStyle(
                        color: fName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      ),
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                    onTap: () {
                      //FocusScope.of(context).unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
                      FocusScope.of(context).requestFocus(fName);
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    focusNode: fAccountNo,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Account No.',
                      labelStyle: TextStyle(
                        color: fAccountNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      ),
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fAccountNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fAccountNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fAccountNo.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(fAccountNo);
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    focusNode: fBankName,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Bank Name',
                      labelStyle: TextStyle(
                        color: fBankName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      ),
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fBankName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fBankName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fBankName.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(fBankName);
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    focusNode: fIfscCode,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'IFSC Code',
                      labelStyle: TextStyle(
                        color: fIfscCode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      ),
                      focusColor: Get.theme.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fIfscCode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fIfscCode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: fIfscCode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      )),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(fIfscCode);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 45,
              width: Get.width / 3,
              //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
              decoration: BoxDecoration(
                color: Get.theme.secondaryHeaderColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                'ADD +',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
