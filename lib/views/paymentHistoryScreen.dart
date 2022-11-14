import 'package:cashbackapp/controllers/paymentController.dart';
import 'package:cashbackapp/utils/date_converter.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context).payment_history,
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<PaymentController>(builder: (controller) {
        return controller.isPaymentHistoryLoaded
            ? controller.paymentHistoryList != null && controller.paymentHistoryList.length > 0
                ? ListView.builder(
                    itemCount: controller.paymentHistoryList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            controller.paymentHistoryList[index].medium == 'UPI'
                                ? Images.upi
                                : controller.paymentHistoryList[index].medium == 'Bank'
                                    ? Images.bank
                                    : Images.amazon,
                            height: 40,
                            width: 40,
                          ),
                          title: Row(
                            children: [
                              Text(
                                controller.paymentHistoryList[index].amount.toString(),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            DateConverter.formatDate(
                              controller.paymentHistoryList[index].createdAt,
                            ),
                          ),
                          trailing: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.paymentHistoryList[index].approved == 1
                                  ? Colors.green
                                  : controller.paymentHistoryList[index].approved == 2
                                      ? Colors.red
                                      : Colors.orange,
                            ),
                            child: Text(
                              controller.paymentHistoryList[index].approved == 1
                                  ? 'Approved'
                                  : controller.paymentHistoryList[index].approved == 2
                                      ? 'Rejected'
                                      : controller.paymentHistoryList[index].approved == 0
                                          ? 'Pending'
                                          : '',
                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                            ),
                          ),
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
                  )
                : Center(
                    child: Text(
                    AppLocalizations.of(context).no_data_found,
                  ))
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
