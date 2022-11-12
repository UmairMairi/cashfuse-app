import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/themeController.dart';
import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key key, this.themeMode}) : super(key: key);
  final ValueChanged<ThemeMode> themeMode;

  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> with SingleTickerProviderStateMixin {
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  // Make a custom ColorSwatch to name map from the above custom colors.
  final Map<ColorSwatch<Object>, String> colorsNameMap = <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  TabController tabController;

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
            title: const Text('Theme'),
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
                        Tab(text: 'Primary Color'),
                        Tab(text: 'Secondary Color'),
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
                          ColorPicker(
                            enableOpacity: true,
                            // Use the pickColor as start color.
                            color: themeController.pickColor,
                            // Update the pickColor using the callback.
                            onColorChanged: (Color color) async {
                              if (color.value == themeController.pickSecondaryColor.value) {
                                showCustomSnackBar('Primary Color & Secondary Should be Different');
                              } else {
                                themeController.setPickColor(color);
                              }
                            },
                            width: 44,
                            height: 44,
                            borderRadius: 22,
                            heading: Text(
                              'Select Primary Color',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            subheading: Text(
                              'Select color shade',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          ColorPicker(
                            enableOpacity: true,
                            // Use the pickColor as start color.
                            color: themeController.pickSecondaryColor,
                            // Update the pickColor using the callback.
                            onColorChanged: (Color color) async {
                              if (color.value == themeController.pickColor.value) {
                                showCustomSnackBar('Primary Color & Secondary Should be Different');
                              } else {
                                themeController.setSecondaryPickColor(color);
                              }
                            },
                            width: 44,
                            height: 44,
                            borderRadius: 22,
                            heading: Text(
                              'Select Secondary Color',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            subheading: Text(
                              'Select color shade',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
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
