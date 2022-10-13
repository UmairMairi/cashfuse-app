import 'package:cashbackapp/utils/images.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyEarningSceen extends StatelessWidget {
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
          'My Earnings',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFBC53E1),
                      Color(0xFF6285E3),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text('Total Eanings'),
                          Icon(
                            Icons.help,
                            size: 22,
                            color: Colors.teal.withOpacity(0.5),
                          )
                        ],
                      ),
                      subtitle: Text(
                        '₹0.00',
                        style: Get.theme.primaryTextTheme.headline5.copyWith(fontWeight: FontWeight.w600),
                      ),
                      trailing: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Color(0xFFBC53E1),
                                  Color(0xFF6285E3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Image.asset(
                              Images.wallet,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DottedLine(
                        dashLength: 3,
                        dashColor: Colors.grey[350],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        'Earning will show here within 72 hours of your shopping via Cashkaro.',
                        style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0FCBF9),
                    Color(0xFFA0F7FE),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Order Details',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DottedLine(
                              dashLength: 1,
                              lineThickness: 1.5,
                              dashGapLength: 1.5,
                              dashColor: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View More ',
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 8,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Color(0xFFBC53E1),
                              Color(0xFF6285E3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.date_range,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0FCBF9),
                    Color(0xFFA0F7FE),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Clicks',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DottedLine(
                              dashLength: 1,
                              lineThickness: 1.5,
                              dashGapLength: 1.5,
                              dashColor: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View More ',
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 8,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Color(0xFFBC53E1),
                              Color(0xFF6285E3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          MdiIcons.gestureTap,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0FCBF9),
                    Color(0xFFA0F7FE),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Request Paymets',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DottedLine(
                              dashLength: 1,
                              lineThickness: 1.5,
                              dashGapLength: 1.5,
                              dashColor: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View More ',
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 8,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Color(0xFFBC53E1),
                              Color(0xFF6285E3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.currency_rupee_rounded,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0FCBF9),
                    Color(0xFFA0F7FE),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Help',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DottedLine(
                              dashLength: 1,
                              lineThickness: 1.5,
                              dashGapLength: 1.5,
                              dashColor: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View More ',
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 8,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Color(0xFFBC53E1),
                              Color(0xFF6285E3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.headset_mic,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
