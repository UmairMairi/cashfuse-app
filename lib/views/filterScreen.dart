import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FILTER BY',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'CLEAR ALL',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'CLOSE',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blueGrey[600],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('Men Clothing'),
                                      ),
                                      Divider(
                                        thickness: 0,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'APPLY (10)',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          color: Get.theme.secondaryHeaderColor,
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
    );
  }
}
