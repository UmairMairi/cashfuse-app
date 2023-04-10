import 'package:cashfuse/models/productModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Mycolors.dart';
import '../product_Details.dart';

class ViewAllProductScreen extends StatefulWidget {
  final String title;
  final List<ProductModel> productList;
  ViewAllProductScreen({Key key, this.title, this.productList})
      : super(key: key);

  @override
  State<ViewAllProductScreen> createState() =>
      _ViewAllProductScreenState(this.title, this.productList);
}

class _ViewAllProductScreenState extends State<ViewAllProductScreen> {
  String title;
  List<ProductModel> productList;

  _ViewAllProductScreenState(this.title, this.productList) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title,
          style: Get.theme.primaryTextTheme.titleSmall
              .copyWith(color: Colors.white),
        ),
      ),
      body: SizedBox(
        // height: 285,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: global.getPlatFrom() ? 5 : 2,
              crossAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
              mainAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
              mainAxisExtent: 285),
          //  scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  // Get.to(
                  //       () => CategoryScreen(
                  //     category: homeController.topCashbackList[index],
                  //   ),
                  //   routeName: 'category',
                  // );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                                title: '',
                                product: productList[index],
                              )));
                },
                child: Container(
                  width: 150,
                  // height: 150,
                  margin: EdgeInsets.only(left: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: RichText(
                          text: TextSpan(
                              text: "Price Comapred ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                              children: [
                                TextSpan(
                                    text:
                                        '(${productList[index].productPrices.length} Sellers)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.blueAccent.shade400)),
                              ]),
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        height: 1,
                      ),
                      Container(
                        height: 120,
                        //   color: Colors.blueAccent,
                        child: Stack(
                          children: [
                            Image.network(
                              "${global.appInfo.baseUrls.productImageurl}/${productList[index].image}",
                              width: MediaQuery.of(context).size.width,
                              // height: 119,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: RichText(
                          text: TextSpan(
                              text: "Brand: ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                              children: [
                                TextSpan(
                                    text: '${productList[index].name} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Colors.black)),
                              ]),
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          "${productList[index].name} ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Mycolors.lightOrage,
                            border: Border.all(color: Mycolors.orange)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                        child: Text(
                          "+ ₹ ${productList[index].productPrices[0].cashback}  REWARDS",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Mycolors.orange),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          "Final Price ₹ ${productList[index].productPrices[0].price}",
                          style: TextStyle(
                              color: Mycolors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
