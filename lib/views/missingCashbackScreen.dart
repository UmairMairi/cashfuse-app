import 'package:cashbackapp/controllers/orderController.dart';
import 'package:cashbackapp/models/orderModel.dart';
import 'package:cashbackapp/views/addTicketSceen.dart';
import 'package:cashbackapp/views/faqSceen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MissingCashbackScreen extends StatelessWidget {
  bool isSHow = false;
  OrderModel orderModel;

  MissingCashbackScreen({this.orderModel});

  OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Order Complaints',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.grey[200],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Get.theme.primaryColor,
            child: Icon(FontAwesomeIcons.commentDots),
            onPressed: () {
              Get.to(() => FaqScreen());
            },
          ),
          body: orderController.complainList != null && orderController.complainList.length > 0
              ? ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemCount: orderController.complainList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      // onTap: () {
                      //   Get.to(
                      //     () => HelpDetailSceen(
                      //       faq: commonController.faqList[index],
                      //     ),
                      //   );
                      // },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: RichText(
                                text: TextSpan(
                                  text: "Complaint : ",
                                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: orderController.complainList[index].complain,
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                        letterSpacing: -0.2,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: RichText(
                                text: TextSpan(
                                  text: "Reply : ",
                                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: orderController.complainList[index].reply.isNotEmpty ? orderController.complainList[index].reply : 'Waiting for reply....',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                        letterSpacing: -0.2,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Get.theme.secondaryHeaderColor,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "You don't have any Missing Tickets",
                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Missing Cashback or Rewards?",
                      style: Get.theme.primaryTextTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AddTicketSceen(
                              orderModel: orderModel,
                            ));
                      },
                      child: Container(
                        height: 40,
                        width: Get.width / 2,
                        color: Get.theme.secondaryHeaderColor,
                        alignment: Alignment.center,
                        child: Text(
                          'ADD A TICKET',
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: InkWell(
            onTap: () {
              Get.to(() => AddTicketSceen(
                    orderModel: orderModel,
                  ));
            },
            child: Container(
              height: 50,
              width: Get.width / 2,
              color: Get.theme.secondaryHeaderColor,
              alignment: Alignment.center,
              child: Text(
                'Add Complaint',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
