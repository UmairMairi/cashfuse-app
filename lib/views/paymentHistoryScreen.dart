import 'package:cashbackapp/controllers/paymentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentHistoryScreen extends StatelessWidget {
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
          'Payment History',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<PaymentController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.paymentHistoryList.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {},
              child: ListTile(
                  // title: Text(
                  //   controller.paymentHistoryList[index].amount.toString(),
                  //   textAlign: TextAlign.center,
                  //   style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                  //     fontSize: 10,
                  //     fontWeight: FontWeight.w500,
                  //     color: index == 0 ? Colors.white : Colors.black,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // CustomImage(
                  //   image: '${global.appInfo.baseUrls.categoryImageUrl}/${controller.topCategoryList[index].image}',
                  //   height: 40,
                  // ),
                  ),
            );
          },
        );
      }),
    );
  }
}
