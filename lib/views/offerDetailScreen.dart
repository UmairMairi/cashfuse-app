import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/views/loginOrSignUpScreen.dart';
import 'package:cashbackapp/views/moreOfferScreen.dart';
import 'package:cashbackapp/views/webViewScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferDetailScreen extends StatelessWidget {
  final OfferModel offer;
  final bool fromSeeMore;
  OfferDetailScreen({this.offer, this.fromSeeMore});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: kToolbarHeight,
          collapsedHeight: kToolbarHeight,
          toolbarHeight: kToolbarHeight,
          floating: true,
          pinned: true,
          elevation: 0,
          backgroundColor: Get.theme.primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            offer.name,
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                global.share('');
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12).copyWith(right: 10),
                padding: EdgeInsets.only(left: 10, right: 3),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Text('Share  '),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green[700],
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  width: Get.width,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CustomImage(
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${offer.bannerImage}',
                            height: 200,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                          Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomImage(
                                image: '${global.appInfo.baseUrls.partnerImageUrl}/${offer.image}',
                                height: 30,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          if (global.currentUser.id != null) {
                            await homeController.addClick(offer.name, global.appInfo.baseUrls.offerImageUrl + '/' + offer.image);
                            await homeController.getTrackingLink(offer.url, offer.affiliatePartner);
                            Get.to(
                              () => WebViewScreen(
                                urlString: homeController.createdLink.isNotEmpty ? homeController.createdLink : offer.url,
                              ),
                            );
                          } else {
                            Get.to(() => LoginOrSignUpScreen());
                          }
                        },
                        child: Container(
                          width: Get.width,
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                          decoration: BoxDecoration(
                            color: Get.theme.secondaryHeaderColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'GRAB DEAL',
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.name,
                          style: Get.theme.primaryTextTheme.subtitle2,
                        ),
                        Text(
                          offer.description,
                          style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                        ),
                        fromSeeMore
                            ? SizedBox()
                            : homeController.seeMoreOfferList != null && homeController.seeMoreOfferList.length > 0
                                ? InkWell(
                                    onTap: () async {
                                      //await homeController.getMoreOffers(offer.id.toString());
                                      Get.bottomSheet(
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          child: MoreOfferScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: Get.width,
                                      height: 45,
                                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.teal[200],
                                            width: 1.5,
                                          )),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'See More Offers  >',
                                        style: TextStyle(color: Colors.teal[200], fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
