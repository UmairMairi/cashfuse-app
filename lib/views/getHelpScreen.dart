import 'package:cashbackapp/controllers/commonController.dart';
import 'package:cashbackapp/views/helpDetailSceen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:shimmer_animation/shimmer_animation.dart';

class GetHelpScreen extends StatelessWidget {
  final fSeachNode = new FocusNode();
  CommonController commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Get Help',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              colors: [
                Get.theme.primaryColor.withOpacity(0.7),
                Get.theme.secondaryHeaderColor.withOpacity(0.4),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.zero,
                  child: TextFormField(
                    focusNode: fSeachNode,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Get.theme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      border: InputBorder.none,
                      hintText: 'What are you looking for?',
                      hintStyle: Get.theme.primaryTextTheme.caption.copyWith(color: Colors.black54, fontSize: 11),
                      prefixIcon: Icon(
                        Icons.search,
                        color: fSeachNode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                      ),
                      prefixIconColor: fSeachNode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              commonController.isfaqLoaded
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: commonController.faqList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 15),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => HelpDetailSceen(
                                faq: commonController.faqList[index],
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child:
                                        // ShaderMask(
                                        //   blendMode: BlendMode.srcIn,
                                        //   shaderCallback: (Rect bounds) {
                                        //     return LinearGradient(
                                        //       colors: [
                                        //         Color(0xFFBC53E1),
                                        //         Color(0xFF6285E3),
                                        //       ],
                                        //       begin: Alignment.topLeft,
                                        //       end: Alignment.bottomRight,
                                        //     ).createShader(bounds);
                                        //   },
                                        //   child:
                                        CustomImage(
                                      image: '${global.appInfo.baseUrls.faqImageUrl}/${commonController.faqList[index].image}',
                                      height: 25,
                                      //width: Get.width,
                                      fit: BoxFit.contain,
                                    ),
                                    // Image.asset(
                                    //   Images.cube,
                                    //   height: 25,
                                    // ),
                                  ),
                                  //),
                                ),
                                Text(
                                  commonController.faqList[index].ques,
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: 8,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 15),
                      itemBuilder: (context, index) {
                        return Shimmer(
                          duration: Duration(seconds: 2),
                          child: Container(
                            // width: Get.width - 120,
                            // height: 165,
                            // margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }),
            ],
          ),
        );
      }),
    );
  }
}
