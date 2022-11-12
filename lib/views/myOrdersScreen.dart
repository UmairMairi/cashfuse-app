import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/orderController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:cashbackapp/utils/date_converter.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/views/missingCashbackScreen.dart';
import 'package:cashbackapp/views/webViewScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class MyOrdersScreen extends StatelessWidget {
  OrderController orderController = Get.find<OrderController>();

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
          'My Orders',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<OrderController>(builder: (controller) {
        return orderController.isDataLoaded
            ? orderController.orderList != null && orderController.orderList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderController.orderList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      padding: EdgeInsets.all(3),
                                      child: CustomImage(
                                        image: global.appInfo.baseUrls.orderImageUrl + '/' + orderController.orderList[index].logo,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    title: Text(orderController.orderList[index].advertisers),
                                    trailing: InkWell(
                                      onTap: () async {
                                        await orderController.getOrderComplains(orderController.orderList[index].id);
                                        Get.to(() => MissingCashbackScreen(
                                              orderModel: orderController.orderList[index],
                                            ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                        child: Text(
                                          'Raise Ticket',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  // Text(
                                  //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                  //   style: TextStyle(
                                  //     fontSize: 12,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: orderController.orderList[index].orderStatus == 0.toString() ? Get.theme.secondaryHeaderColor.withOpacity(0.2) : Colors.green.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: orderController.orderList[index].orderStatus == 0.toString() ? Get.theme.secondaryHeaderColor : Colors.green,
                                                size: 20,
                                              ),
                                              Text(
                                                orderController.orderList[index].orderStatus == 0.toString() ? 'Clicked Tracked' : 'Cashback Received',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: orderController.orderList[index].orderStatus == 0.toString() ? Get.theme.secondaryHeaderColor : Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        orderController.orderList[index].url.isNotEmpty
                                            ? InkWell(
                                                onTap: () {
                                                  Get.to(() => WebViewScreen(
                                                        brandName: orderController.orderList[index].advertisers,
                                                        urlString: orderController.orderList[index].url,
                                                      ));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.local_offer,
                                                        textDirection: TextDirection.rtl,
                                                        color: Colors.black54,
                                                        size: 20,
                                                      ),
                                                      Text(
                                                        'Shopping',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.all(10).copyWith(top: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 20,
                                      color: orderController.orderList[index].orderStatus == 0.toString() || orderController.orderList[index].orderStatus == 1.toString() ? Get.theme.secondaryHeaderColor : Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Clicked Tracked',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: orderController.orderList[index].orderStatus == 0.toString() || orderController.orderList[index].orderStatus == 1.toString() ? Colors.black : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    orderController.orderList[index].orderStatus == 0.toString() || orderController.orderList[index].orderStatus == 1.toString()
                                        ? Text(
                                            DateConverter.formatDate(
                                              orderController.orderList[index].referDate,
                                            ),
                                            style: TextStyle(fontSize: 10, color: Colors.grey),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: DottedLine(
                                        lineLength: 125,
                                        direction: Axis.vertical,
                                        dashColor: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          margin: EdgeInsets.zero,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            Icons.check_circle,
                                            size: 20,
                                            color: orderController.orderList[index].orderStatus == 1.toString() ? Get.theme.primaryColor : Colors.grey,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Sale Tracked',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: orderController.orderList[index].orderStatus == 1.toString() ? Colors.black : Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        orderController.orderList[index].orderStatus == 1.toString()
                                            ? Text(
                                                DateConverter.formatDate(
                                                  orderController.orderList[index].createdAt,
                                                ),
                                                style: TextStyle(fontSize: 10, color: Colors.grey),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 20,
                                      color: orderController.orderList[index].orderStatus == 1.toString() ? Colors.green : Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Cashback Received',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: orderController.orderList[index].orderStatus == 1.toString() ? Colors.black : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    orderController.orderList[index].orderStatus == 1.toString()
                                        ? Text(
                                            DateConverter.formatDate(
                                              orderController.orderList[index].createdAt,
                                            ),
                                            style: TextStyle(fontSize: 10, color: Colors.grey),
                                          )
                                        : SizedBox(),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   color: Colors.red,
                          //   alignment: Alignment.topLeft,
                          //   child: FixedTimeline.tileBuilder(
                          //     clipBehavior: Clip.none,
                          //     mainAxisSize: MainAxisSize.min,
                          //     theme: TimelineThemeData(
                          //       indicatorTheme: IndicatorThemeData(color: Get.theme.secondaryHeaderColor),
                          //       connectorTheme: ConnectorThemeData(color: Colors.black, thickness: 0.5, space: 10),
                          //       nodeItemOverlap: true,
                          //     ),
                          //     builder: TimelineTileBuilder.connectedFromStyle(
                          //       connectorStyleBuilder: (context, index) {
                          //         return ConnectorStyle.dashedLine;
                          //       },
                          //       contentsBuilder: (context, index) {
                          //         return SizedBox(
                          //           child: ListTile(
                          //             dense: true,
                          //             title: Text('Click Tracked'),
                          //             subtitle: Text(
                          //               '20% off',
                          //               style: TextStyle(
                          //                 fontSize: 10,
                          //                 color: Colors.black54,
                          //               ),
                          //             ),
                          //             trailing: Text(
                          //               '10:00 pm | 7 Nov 2022',
                          //               style: TextStyle(fontSize: 10, color: Colors.grey),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //       contentsAlign: ContentsAlign.basic,
                          //       firstConnectorStyle: ConnectorStyle.transparent,
                          //       lastConnectorStyle: ConnectorStyle.transparent,
                          //       indicatorStyleBuilder: (context, index) {
                          //         return IndicatorStyle.dot;
                          //       },
                          //       itemExtent: 70.0,
                          //       itemCount: 3,
                          //     ),
                          //   ),
                          // )
                        ],
                      );
                    })
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.Click_image,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "There is where it all happens!",
                            style: Get.theme.primaryTextTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Text(
                            "Once you shop via ${global.appName}, your order details will appear here within 72 hours.",
                            textAlign: TextAlign.center,
                            //style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Get.find<SplashController>().bannerShow();
                            Get.find<BottomNavigationController>().setBottomIndex(0);
                            Get.to(() => BottomNavigationBarScreen());
                          },
                          child: Container(
                            height: 45,
                            width: Get.width / 2.5,
                            //margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                            decoration: BoxDecoration(
                              color: Get.theme.secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'SEE BEST DEALS',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
