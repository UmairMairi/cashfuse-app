import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/helpDetailSceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetHelpScreen extends StatelessWidget {
  final fSeachNode = new FocusNode();

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
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBC53E1),
              Color(0xFF6285E3),
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
            GridView.builder(
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
                return InkWell(
                  onTap: () {
                    Get.to(() => HelpDetailSceen());
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
                                Images.cube,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'How CashKaro Works?',
                          textAlign: TextAlign.center,
                          style: Get.theme.primaryTextTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
