import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:provider/provider.dart';
import '../provider/admit_detail_provider.dart';
import '../utils/Mycolors.dart';

class ProductDetails extends StatefulWidget {
  String title;
  Map productData={};
   ProductDetails({Key key,this.title,this.productData}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    print('ajsbdjh');
    print("${global.appInfo.baseUrls.productSiteUrl}/${widget.productData['product_prices'][0]['site_icon']}");

    const List<String> list = <String>['1','2','3','4','5'];
    String dropdownValue = list.first;
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
          widget.title,
          style: Get.theme.primaryTextTheme.titleSmall.copyWith(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 15,
                top: 10,
                bottom: 10
              ),
              child: Text("${widget.productData['name']}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600
              ),),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 200.0,
              autoPlay: true),
              items: [widget.productData['image']].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            //color: Colors.amber
                        ),
                        child: Image.network(
                          "${global.appInfo.baseUrls.productImageurl}/${i}",
                          fit: BoxFit.fill,
                        )
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 10
                      ),
                      child: Text("Choose Varient",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black
                      ),),
                    ),
                    SizedBox(height: 10,),


                    Container(
          margin: EdgeInsets.only(
              right: 5,
            left: 10
          ),
          alignment: Alignment.center,
          width: 160,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
            ),
            onChanged: (String value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                    width: 100,
                    child: Text(value)),
              );
            }).toList(),
          ),
        )

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Colour",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                      ),),
                    SizedBox(height: 10,),


                    Container(
          margin: EdgeInsets.only(
            right: 10
          ),
          alignment: Alignment.center,
          width: 160,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
            ),
            onChanged: (String value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: 100,
                    child: Text(value)),
              );
            }).toList(),
          ),
        )

                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15
              ),
              color: Colors.grey.shade300,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Choose Best Price",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 10,),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:widget.productData['product_prices'].length,
              itemBuilder: (BuildContext context, int index)  {
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10
                  ),
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "${global.appInfo.baseUrls.productSiteUrl}/${widget.productData['product_prices'][index]['site_icon']}",
                                height: 40,
                                width: 100,
                              ),
                              Icon(Icons.info_outline_rounded,
                              color: Colors.grey,
                              size: 20,)
                            ],
                          ),
                          InkWell(
                            onTap: ()
                            {
                              final getLinkProvider=Provider.of<AdmitedOffers>(context,listen: false);
                              getLinkProvider.admitedGetLink(
                                  widget.productData['product_prices'][index]['url'].toString(),
                                  widget.productData['affiliate_partner'].toString(),
                                  widget.productData['c_id'].toString(),
                              ).then((value) {
                                print('ahjbshjdbhjsabd');
                                print('${value['tracking_link']}');
                                global.launchInBrowser(
                                  value['tracking_link'],
                                );
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 13,
                                right: 13,
                                bottom: 3,
                                top: 3
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black,
                              ),
                              child: Text("Grab Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13
                              ),),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("${widget.productData['product_prices'][index]['mrp']}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                              ),),
                              Text("Seller price",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                              ),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 2,
                            height: 70,
                            color: Colors.grey,
                          ),

                          Column(
                            children: [
                              Text("${widget.productData['cashback']}",
                                style: TextStyle(
                                    color: Mycolors.orange,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12
                                ),),
                              Text("CashBack",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12
                                ),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 2,
                            height: 70,
                            color: Colors.grey,
                          ),

                          Column(
                            children: [
                              Text("${widget.productData['product_prices'][index]['price']}",
                                style: TextStyle(
                                    color: Mycolors.orange,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12
                                ),),
                              Text("Best Price",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12
                                ),),
                            ],
                          ),
                          SizedBox(width: 10,),
                        ],
                      )

                    ],
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
