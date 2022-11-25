import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class WebBannerView extends StatelessWidget {
  final HomeController homeController;
  WebBannerView({@required this.homeController});

  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: SizedBox(
          width: AppConstants.WEB_MAX_WIDTH,
          height: 220,
          child: homeController.topBannerList != null
              ? Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: (homeController.topBannerList.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        int index1 = index * 2;
                        int index2 = (index * 2) + 1;
                        bool _hasSecond = index2 < homeController.topBannerList.length;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(children: [
                            Expanded(
                                child: InkWell(
                              onTap: () => {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomImage(
                                  image: '${global.appInfo.baseUrls.bannerImageUrl}/${homeController.topBannerList[index1].image}',
                                  fit: BoxFit.cover,
                                  height: 220,
                                ),
                              ),
                            )),
                            SizedBox(width: 20),
                            Expanded(
                                child: _hasSecond
                                    ? InkWell(
                                        onTap: () => {},
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CustomImage(
                                            image: '${global.appInfo.baseUrls.bannerImageUrl}/${homeController.topBannerList[index2].image}',
                                            fit: BoxFit.fill,
                                            height: 220,
                                          ),
                                        ),
                                      )
                                    : SizedBox()),
                          ]),
                        );
                      },
                      onPageChanged: (int index) => homeController.setBannerIndex(index),
                    ),
                    homeController.bannerIndex != 0
                        ? Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            child: InkWell(
                              onTap: () => _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOut),
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          )
                        : SizedBox(),
                    homeController.bannerIndex != ((homeController.topBannerList.length / 2).ceil() - 1)
                        ? Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () => _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut),
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Icon(Icons.arrow_forward),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                )
              : WebBannerShimmer()),
    );
  }
}

class WebBannerShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Expanded(
              child: Container(
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
          )),
          SizedBox(width: 20),
          Expanded(
              child: Container(
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
          )),
        ]),
      ),
    );
  }
}
