import 'dart:developer';

import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/themeController.dart';
import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key key, this.themeMode}) : super(key: key);
  final ValueChanged<ThemeMode> themeMode;

  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  List<ColorSwatch> fullMaterialColors = const <ColorSwatch>[
    const ColorSwatch(0xFF000000, {500: Colors.black}),
    Colors.red,
    Colors.redAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        Get.find<BottomNavigationController>().setBottomIndex(4);
        Get.to(() => BottomNavigationBarScreen());
        return;
      }),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context).theme,
            ),
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.find<BottomNavigationController>().setBottomIndex(4);
                Get.to(() => BottomNavigationBarScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
          body: Scrollbar(
            child: GetBuilder<ThemeController>(builder: (themeController) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: tabController.index != 0 ? themeController.pickColor : themeController.pickSecondaryColor,
                      indicator: BoxDecoration(
                        color: tabController.index == 0 ? themeController.pickColor : themeController.pickSecondaryColor,
                      ),
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context).primary_color,
                        ),
                        Tab(
                          text: AppLocalizations.of(context).secondary_color,
                        ),
                      ],
                      onTap: (value) {
                        tabController.index = value;
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          MaterialColorPicker(
                            selectedColor: themeController.pickColor,
                            colors: fullMaterialColors,
                            shrinkWrap: true,
                            // onColorChange: (color) {
                            //   if (color.value == themeController.pickSecondaryColor.value) {
                            //     showCustomSnackBar('Primary Color & Secondary Should be Different');
                            //   } else {
                            //     themeController.setPickColor(color);
                            //   }
                            // },
                            allowShades: false,
                            onMainColorChange: (color) {
                              log(Color(color.value).value.toString());
                              if (Color(color.value).value == themeController.pickSecondaryColor.value) {
                                showCustomSnackBar('Primary Color & Secondary Should be Different');
                              } else {
                                themeController.setPickColor(Color(color.value));
                              }
                            },
                          ),
                          MaterialColorPicker(
                              selectedColor: themeController.pickSecondaryColor,
                              colors: fullMaterialColors,
                              shrinkWrap: false,
                              allowShades: false,
                              onMainColorChange: (color) {
                                log(Color(color.value).value.toString());
                                if (Color(color.value).value == themeController.pickColor.value) {
                                  showCustomSnackBar('Primary Color & Secondary Should be Different');
                                } else {
                                  themeController.setSecondaryPickColor(Color(color.value));
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          )),
    );
  }
}
