import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;

import '../../utils/Mycolors.dart';
import '../product_Details.dart';

class ViewAllProductScreen extends StatefulWidget {
  Map productList={};
   ViewAllProductScreen({Key key,this.productList}) : super(key: key);

  @override
  State<ViewAllProductScreen> createState() => _ViewAllProductScreenState();
}

class _ViewAllProductScreenState extends State<ViewAllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Most Selling Products",
          style: Get.theme.primaryTextTheme.titleSmall.copyWith(color: Colors.white),
        ),
      ),


      body:SizedBox(
       // height: 285,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: global.getPlatFrom() ? 5 : 2,
              crossAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
              mainAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
              mainAxisExtent: 285
            ),
        //  scrollDirection: Axis.horizontal,
          itemCount: widget.productList['data'].length,
          shrinkWrap: true,
          // padding: const EdgeInsets.symmetric(horizontal: 6),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  // Get.to(
                  //       () => CategoryScreen(
                  //     category: homeController.topCashbackList[index],
                  //   ),
                  //   routeName: 'category',
                  // );
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ProductDetails(
                    title:widget.productList['data'][index]['name'] ,
                    productData:widget.productList['data'][index] ,
                  )));
                },
                child: Container(
                  width:150,
                 // height: 150,
                  margin: EdgeInsets.only(
                      left: 10
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Price Comapred",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10
                              ),
                              children: [
                                TextSpan(text: '${widget.productList['data'][index]['product_prices'].length}', style: TextStyle(fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.blueAccent.shade400
                                )),
                              ]
                          ),
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
                              "${global.appInfo.baseUrls.productImageurl}/${widget.productList['data'][index]['image']}",
                              width: MediaQuery.of(context).size.width,
                             // height: 119,
                              fit: BoxFit.fill,

                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 2
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight:Radius.circular(10)
                                  )
                              ),
                              child: Text("New Lauch",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                ),),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8),
                        child: RichText(
                          text: TextSpan(
                              text: "Brand: ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10
                              ),
                              children: [
                                TextSpan(text:'${widget.productList['data'][index]['name']} ', style: TextStyle(fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.black
                                )),
                              ]
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        height: 1,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8),
                        child: Text(
                          "${widget.productList['data'][index]['name']} ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ),

                        ),

                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Mycolors.lightOrage,
                            border: Border.all(
                                color: Mycolors.orange
                            )
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 3
                        ),
                        child:
                        Text("+${widget.productList['data'][index]['cashback']}  CASHBACK",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Mycolors.orange
                          ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8),
                        child: Text(
                          "Final Price ${widget.productList['data'][index]['product_prices'][0]['price']}",
                          style: TextStyle(
                              color: Mycolors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          ),

                        ),

                      ),

                    ],
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}
