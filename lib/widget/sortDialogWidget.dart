import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 190,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'SORT BY',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              'Popular',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.orange[800]),
            ),
            Divider(),
            Text(
              'Discount',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
            Divider(),
            Text(
              'High price',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
            Divider(),
            Text(
              'Low price',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
