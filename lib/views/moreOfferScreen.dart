import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/views/campaignDetailScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class MoreOfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'See more offers',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.1,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
              ),
              ListView.builder(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: homeController.seeMoreOfferList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            // decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: Colors.white,
                            //     border: Border.all(
                            //       color: Colors.grey[200],
                            //     )),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomImage(
                                image: '${global.appInfo.baseUrls.offerImageUrl}/${homeController.seeMoreOfferList[index].image}',
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.seeMoreOfferList[index].name,
                                    textAlign: TextAlign.start,
                                    style: Get.theme.primaryTextTheme.subtitle2,
                                  ),
                                  Text(
                                    homeController.seeMoreOfferList[index].description,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          Get.back();
                          await homeController.getCampignDetails(homeController.seeMoreOfferList[index].id.toString());
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => OfferDetailScreen(
                                offer: homeController.offer,
                                fromSeeMore: true,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: Get.width / 2,
                          height: 45,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Get.theme.secondaryHeaderColor,
                                width: 1,
                              )),
                          alignment: Alignment.center,
                          child: Text(
                            homeController.seeMoreOfferList[index].buttonText,
                            style: TextStyle(color: Get.theme.secondaryHeaderColor, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey[200],
                      ),
                    ],
                  );
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Expires in 15 days',
                  //       style: TextStyle(
                  //         fontSize: 11,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //       child: Text('Earn upto 6% Cashback on all Myntra Orders + 24% Bonus Cashback (Once per user)'),
                  //     ),
                  //     Text(
                  //       'See Details',
                  //       style: TextStyle(
                  //         fontSize: 10,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //     Container(
                  //       width: Get.width / 2,
                  //       height: 45,
                  //       margin: EdgeInsets.only(top: 10, bottom: 10),
                  //       padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           border: Border.all(
                  //             color: Get.theme.secondaryHeaderColor,
                  //             width: 1,
                  //           )),
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         'ACTIVATE CASHBACK',
                  //         style: TextStyle(color: Get.theme.secondaryHeaderColor, fontSize: 14, fontWeight: FontWeight.w600),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 10,
                  //       margin: EdgeInsets.symmetric(vertical: 10),
                  //       color: Colors.grey[200],
                  //     ),
                  //   ],
                  // );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}