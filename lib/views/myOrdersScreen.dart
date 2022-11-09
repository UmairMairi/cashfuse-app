import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/missingCashbackScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class MyOrdersScreen extends StatelessWidget {
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
      body: Column(
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
                        image: Images.amazon,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text('Amazon'),
                    trailing: InkWell(
                      onTap: () {
                        Get.to(() => MissingCashbackScreen());
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
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            color: Get.theme.secondaryHeaderColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Get.theme.secondaryHeaderColor,
                                size: 20,
                              ),
                              Text(
                                'Clicked Tracked',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Get.theme.secondaryHeaderColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                      color: Get.theme.secondaryHeaderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Clicked Tracked',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '10:00 pm | 7 Nov 2022',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
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
                            color: Get.theme.primaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sale Tracked',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          '10:00 pm | 7 Nov 2022',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Cashback Received',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '10:00 pm | 7 Nov 2022',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
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
      ),
    );
  }
}
