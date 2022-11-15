import 'package:cashbackapp/controllers/paymentController.dart';
import 'package:cashbackapp/utils/date_converter.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentScreen extends StatelessWidget {
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
          AppLocalizations.of(context).payments,
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<PaymentController>(builder: (controller) {
        return global.currentUser.withdrawalRequest.length > 0
            ? ListView.builder(
                itemCount: global.currentUser.withdrawalRequest.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        global.currentUser.withdrawalRequest[index].medium == 'UPI'
                            ? Images.upi
                            : global.currentUser.withdrawalRequest[index].medium == 'Bank'
                                ? Images.bank
                                : Images.amazon,
                        height: 40,
                        width: 40,
                      ),
                      title: Row(
                        children: [
                          Text(
                            global.currentUser.withdrawalRequest[index].amount.toString(),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        DateConverter.formatDate(
                          global.currentUser.withdrawalRequest[index].createdAt,
                        ),
                      ),
                      trailing: Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: global.currentUser.withdrawalRequest[index].approved == 1
                              ? Colors.green
                              : global.currentUser.withdrawalRequest[index].approved == 2
                                  ? Colors.red
                                  : Colors.orange,
                        ),
                        child: Text(
                          global.currentUser.withdrawalRequest[index].approved == 1
                              ? 'Approved'
                              : global.currentUser.withdrawalRequest[index].approved == 2
                                  ? 'Rejected'
                                  : global.currentUser.withdrawalRequest[index].approved == 0
                                      ? 'Pending'
                                      : '',
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  AppLocalizations.of(context).no_data_found,
                ),
              );
      }),
    );
  }
}
