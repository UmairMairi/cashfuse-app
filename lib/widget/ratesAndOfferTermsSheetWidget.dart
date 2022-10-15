import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatesAndOfferTermsSheetWidget extends StatelessWidget {
  final bool isOffer;
  RatesAndOfferTermsSheetWidget({this.isOffer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isOffer ? 'Offer Terms' : 'Cashback Rates',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: isOffer
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Key Points',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 10,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    horizontalTitleGap: 10,
                                    minLeadingWidth: 0,
                                    leading: CircleAvatar(
                                      radius: 3,
                                      backgroundColor: Colors.black54,
                                    ),
                                    title: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 10,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                child: RichText(
                                  text: TextSpan(
                                    text: '6%',
                                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                      color: Get.theme.secondaryHeaderColor,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '      Cashback for New Myntra Users',
                                        style: Get.theme.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          color: Get.theme.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: RatesAndOfferTermsSheetWidget(
                        isOffer: false,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Cashback Rates',
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 22,
                color: Colors.white.withOpacity(0.3),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: RatesAndOfferTermsSheetWidget(
                        isOffer: true,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Offer Terms',
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
