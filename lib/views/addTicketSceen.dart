// ignore_for_file: must_be_immutable

import 'package:cashbackapp/controllers/orderController.dart';
import 'package:cashbackapp/models/orderModel.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTicketSceen extends StatelessWidget {
  final OrderModel orderModel;
  AddTicketSceen({this.orderModel});
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
          'Add Complaint',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Card(
                child: TextFormField(
                  cursorColor: Get.theme.primaryColor,
                  controller: orderController.complain,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              )
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: Colors.teal,
          //           child: Text(
          //             '1',
          //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
          //           ),
          //         ),
          //         Text(
          //           '  Date of Transaction',
          //           style: Get.theme.primaryTextTheme.subtitle2,
          //         )
          //       ],
          //     ),
          //     Container(
          //       width: Get.width,
          //       color: Colors.white,
          //       padding: EdgeInsets.all(10),
          //       margin: EdgeInsets.symmetric(vertical: 10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Date of Transaction',
          //             style: Get.theme.primaryTextTheme.subtitle2.copyWith(
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black54,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           InkWell(
          //             onTap: () {
          //               showDateRangePicker(
          //                 context: context,
          //                 currentDate: DateTime.now(),
          //                 initialEntryMode: DatePickerEntryMode.calendar,
          //                 initialDateRange: DateTimeRange(start: DateTime.now(), end: DateTime.now()),
          //                 firstDate: DateTime.now(),
          //                 lastDate: DateTime.now(),
          //               );
          //             },
          //             child: Text(
          //               'DD/MM/YYYY',
          //               style: Get.theme.primaryTextTheme.subtitle2.copyWith(
          //                 fontWeight: FontWeight.w400,
          //                 color: Colors.black54,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: Colors.teal,
          //           child: Text(
          //             '2',
          //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
          //           ),
          //         ),
          //         Text(
          //           '  Retailer Name',
          //           style: Get.theme.primaryTextTheme.subtitle2,
          //         )
          //       ],
          //     ),
          //     Container(
          //       width: Get.width,
          //       color: Colors.white,
          //       padding: EdgeInsets.all(10),
          //       margin: EdgeInsets.symmetric(vertical: 10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Retailer Name',
          //             style: Get.theme.primaryTextTheme.subtitle2.copyWith(
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black54,
          //             ),
          //           ),
          //           DropdownButtonFormField(
          //             hint: Text(
          //               'Please Select',
          //               style: Get.theme.primaryTextTheme.subtitle2.copyWith(
          //                 fontWeight: FontWeight.w400,
          //                 color: Colors.black54,
          //               ),
          //             ),
          //             items: [],
          //             onChanged: (val) {},
          //           )
          //         ],
          //       ),
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: Colors.teal,
          //           child: Text(
          //             '3',
          //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
          //           ),
          //         ),
          //         Text(
          //           '  Transaction Details',
          //           style: Get.theme.primaryTextTheme.subtitle2,
          //         )
          //       ],
          //     ),
          //     Container(
          //       width: Get.width,
          //       height: 40,
          //       margin: EdgeInsets.symmetric(vertical: 10),
          //       color: Colors.white,
          //       alignment: Alignment.centerLeft,
          //       padding: EdgeInsets.only(left: 10),
          //       child: Text(
          //         'Select Transaction',
          //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(
          //           fontWeight: FontWeight.w400,
          //           color: Colors.black54,
          //         ),
          //       ),
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: Colors.teal,
          //           child: Text(
          //             '4',
          //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
          //           ),
          //         ),
          //         Text(
          //           '  Details',
          //           style: Get.theme.primaryTextTheme.subtitle2,
          //         )
          //       ],
          //     ),
          //     Container(
          //       width: Get.width,
          //       margin: EdgeInsets.symmetric(vertical: 10),
          //       padding: EdgeInsets.all(10),
          //       color: Colors.white,
          //       alignment: Alignment.centerLeft,
          //       child: Column(
          //         children: [
          //           TextFormField(
          //             decoration: InputDecoration(
          //               hintText: 'Order/Booking ID',
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Text(
          //             'Note- We only accept the following special characters /-.#',
          //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black54,
          //             ),
          //           ),
          //           TextFormField(
          //             decoration: InputDecoration(
          //               hintText: 'Order Amount (Excluding GST)',
          //             ),
          //           ),
          //           SizedBox(
          //             height: 20,
          //           ),
          //           TextFormField(
          //             decoration: InputDecoration(
          //               hintText: 'Item (s) Purchased',
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (orderController.complain.text.trim().isNotEmpty) {
            orderController.addOrderComplain(orderModel.id, orderController.complain.text);
          } else {
            showCustomSnackBar('Please add Complaint.');
          }
        },
        child: Container(
          height: 50,
          width: Get.width,
          color: Get.theme.secondaryHeaderColor,
          alignment: Alignment.center,
          child: Text(
            'SUBMIT',
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
