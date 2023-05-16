// import 'package:cashfuse/controllers/splashController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

HomeController homeController = Get.find<HomeController>();

class CountrySelectWidget extends StatefulWidget {
  const CountrySelectWidget({Key key}) : super(key: key);

  @override
  State<CountrySelectWidget> createState() => _CountrySelectWidgetState();
}

class _CountrySelectWidgetState extends State<CountrySelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        // alignment: Alignment.topCenter,
        // clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () async {
              global.showCountryPopUp = false;
              setState(() {});
              Get.to(() => BottomNavigationBarScreen(),
                  preventDuplicates: false, routeName: 'home');
            },
            child: CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            width: Get.width / 1.3,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No offers available in your country.',
                  style: Get.theme.primaryTextTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                global.appInfo.countryselection == 1
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height: 0,
                          thickness: 0.9,
                        ),
                      )
                    : SizedBox(),
                global.appInfo.countryselection == 1
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Please select country from below list',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            // fontWeight: FontWeight.w600,
                            color: Colors.red,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SizedBox(),
                global.appInfo.countryselection != 1
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 5),
                        shrinkWrap: true,
                        itemCount: global.appInfo.countries.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(global
                                    .appInfo.countries[index].countryName),
                              ),
                              Radio(
                                groupValue: global.country,
                                value: global.appInfo.countries[index],
                                onChanged: (value) async {
                                  if (value != null) {
                                    // global.country = value;
                                    // global.appInfo.countries
                                    //     .map((e) => e.isSelected = false)
                                    //     .toList();
                                    // global.appInfo.countries[index]
                                    //     .isSelected = true;

                                    // global.showCountryPopUp = false;

                                    // setState(() {});

                                    global.country = value;
                                    global.countrySlug = global.country.slug;

                                    setState(() {});

                                    Get.to(() => BottomNavigationBarScreen(),
                                        preventDuplicates: false,
                                        routeName: 'home');

                                    // homeController.topBannerList = [];
                                    // homeController.topCategoryList = [];
                                    // // couponController.couponList = [];
                                    // homeController.topCashbackList = [];
                                    // homeController.exclusiveOfferList = [];
                                    // homeController.productList = [];
                                    // homeController.trendingProductList = [];
                                    // homeController.newFlashOfferList = [];
                                    // homeController.homeAdvList = [];
                                    // homeController.allAdvList = [];

                                    // await homeController.init();

                                    // setState(() {});
                                  }
                                },
                              )
                            ],
                          );
                        },
                      )
                    : SizedBox(),
              ],
            ),
          ),

          // Positioned(
          //    top: !global.getPlatFrom() ? -50 : 10,
          //   // right: -7,
          //   child: InkWell(
          //     onTap: () async {
          //       Get.back();
          //     },
          //     child: CircleAvatar(
          //       radius: 15,
          //       child: Icon(
          //         Icons.close,
          //         color: Colors.black,
          //         size: 20,
          //       ),
          //       backgroundColor: Colors.grey[400],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Widget countrySelectWidget(HomeController homeController) {
//   return Center(
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       // mainAxisAlignment: MainAxisAlignment.start,
//       // alignment: Alignment.topCenter,
//       // clipBehavior: Clip.none,
//       children: [
//         InkWell(
//           onTap: () async {
//             Get.back();
//             global.showCountryPopUp = false;
//           },
//           child: CircleAvatar(
//             radius: 15,
//             child: Icon(
//               Icons.close,
//               color: Colors.black,
//               size: 20,
//             ),
//             backgroundColor: Colors.white,
//           ),
//         ),
//         Container(
//           width: Get.width / 1.3,
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           margin: EdgeInsets.symmetric(vertical: 20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'No offers available in your country.',
//                 style: Get.theme.primaryTextTheme.titleMedium.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.red,
//                   height: 1.2,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               global.appInfo.countryselection == 1
//                   ? Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: Divider(
//                         height: 0,
//                         thickness: 0.9,
//                       ),
//                     )
//                   : SizedBox(),
//               global.appInfo.countryselection == 1
//                   ? Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text(
//                         'Please select country from below list',
//                         style: Get.theme.primaryTextTheme.bodySmall.copyWith(
//                           // fontWeight: FontWeight.w600,
//                           color: Colors.red,
//                           height: 1.2,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   : SizedBox(),
//               global.appInfo.countryselection != 1
//                   ? StatefulBuilder(
//                       builder: (BuildContext context, StateSetter setState) =>
//                           ListView.builder(
//                         padding: EdgeInsets.only(top: 5),
//                         shrinkWrap: true,
//                         itemCount: global.appInfo.countries.length,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(global
//                                     .appInfo.countries[index].countryName),
//                               ),
//                               Radio(
//                                 groupValue: global.country,
//                                 value: global.appInfo.countries[index],
//                                 onChanged: (value) async {
//                                   if (value != null) {
//                                     global.country = value;
//                                     global.appInfo.countries
//                                         .map((e) => e.isSelected = false)
//                                         .toList();
//                                     global.appInfo.countries[index].isSelected =
//                                         true;

//                                     global.showCountryPopUp = false;

//                                     setState(() {});

//                                     global.country = value;
//                                     global.countrySlug = global.country.slug;
//                                     homeController.topBannerList = [];
//                                     homeController.topCategoryList = [];
//                                     // couponController.couponList = [];
//                                     homeController.topCashbackList = [];
//                                     homeController.exclusiveOfferList = [];
//                                     homeController.productList = [];
//                                     homeController.trendingProductList = [];
//                                     homeController.newFlashOfferList = [];
//                                     homeController.homeAdvList = [];
//                                     homeController.allAdvList = [];

                                    

//                                     await homeController.init();

//                                     setState(() {});
//                                   }
//                                 },
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     )
//                   : SizedBox(),
//             ],
//           ),
//         ),

//         // Positioned(
//         //    top: !global.getPlatFrom() ? -50 : 10,
//         //   // right: -7,
//         //   child: InkWell(
//         //     onTap: () async {
//         //       Get.back();
//         //     },
//         //     child: CircleAvatar(
//         //       radius: 15,
//         //       child: Icon(
//         //         Icons.close,
//         //         color: Colors.black,
//         //         size: 20,
//         //       ),
//         //       backgroundColor: Colors.grey[400],
//         //     ),
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CountrySelectWidget extends StatefulWidget {
//   @override
//   _CountrySelectWidgetState createState() => _CountrySelectWidgetState();
// }

// class _CountrySelectWidgetState extends State<CountrySelectWidget> {
//   OverlayEntry _overlayEntry;

//   @override
//   void initState() {
//     super.initState();
//     _overlayEntry = createOverlayEntry();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Overlay.of(context).insert(_overlayEntry);
//     });
//   }

//   OverlayEntry createOverlayEntry() {
//     return OverlayEntry(
//       // opaque: true,
//       // maintainState: true,
//       builder: (context) => Center(
//         // top: 100.0,
//         // left: 50.0,
//         child: Container(
//           width: Get.width / 1.2,
//           height: Get.height * 0.3,
//           color: Colors.white,
//           child: Scaffold(
//               body: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   // alignment: Alignment.topCenter,
//                   // clipBehavior: Clip.none,
//                   children: [
//                 // InkWell(
//                 //   onTap: () async {
//                 //     Get.back();
//                 //   },
//                 //   child: CircleAvatar(
//                 //     radius: 15,
//                 //     child: Icon(
//                 //       Icons.close,
//                 //       color: Colors.black,
//                 //       size: 20,
//                 //     ),
//                 //     backgroundColor: Colors.white,
//                 //   ),
//                 // ),
//                 Container(
//                     height: Get.height * 0.3,
//                     // width: Get.width / 1.3,
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                     // margin: EdgeInsets.symmetric(vertical: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'No offers available in your country.',
//                             style:
//                                 Get.theme.primaryTextTheme.titleMedium.copyWith(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.red,
//                               height: 1.2,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           global.appInfo.countryselection != 1
//                               ? Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 15),
//                                   child: Divider(
//                                     height: 0,
//                                     thickness: 0.9,
//                                   ),
//                                 )
//                               : SizedBox(),
//                           global.appInfo.countryselection != 1
//                               ? Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Text(
//                                     'Please select country from below list',
//                                     style: Get.theme.primaryTextTheme.bodySmall
//                                         .copyWith(
//                                       // fontWeight: FontWeight.w600,
//                                       color: Colors.red,
//                                       height: 1.2,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 )
//                               : SizedBox(),
//                           global.appInfo.countryselection != 1
//                               ? StatefulBuilder(
//                                   builder: (BuildContext context,
//                                           StateSetter setState) =>
//                                       ListView.builder(
//                                     padding: EdgeInsets.only(top: 5),
//                                     shrinkWrap: true,
//                                     itemCount: global.appInfo.countries.length,
//                                     itemBuilder: (context, index) {
//                                       return Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Text(global.appInfo
//                                                 .countries[index].countryName),
//                                           ),
//                                           Radio(
//                                             groupValue: global.country,
//                                             value:
//                                                 global.appInfo.countries[index],
//                                             onChanged: (value) {
//                                               if (value != null) {
//                                                 global.country = value;
//                                                 global.appInfo.countries
//                                                     .map((e) =>
//                                                         e.isSelected = false)
//                                                     .toList();
//                                                 global.appInfo.countries[index]
//                                                     .isSelected = true;

//                                                 setState(() {});
//                                               }
//                                             },
//                                           )
//                                         ],
//                                       );
//                                     },
//                                   ),
//                                 )
//                               : SizedBox()
//                         ]))
//               ])),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // Your main content here
//         // child: TextButton(
//         //   child: Text('Show Popup'),
//         //   onPressed: () {
//         //     _overlayEntry = createOverlayEntry();
//         //     Overlay.of(context).insert(_overlayEntry);
//         //   },
//         // ),
//         );
//   }

//   @override
//   void dispose() {
//     _overlayEntry?.remove();
//     super.dispose();
//   }
// }
