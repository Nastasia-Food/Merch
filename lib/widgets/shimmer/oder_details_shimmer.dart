import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/order_details_controller.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/widgets/order_detils_bottom_bar.dart';
import 'package:shimmer/shimmer.dart';

class Order_detailsShimmer extends StatefulWidget {
  final int? orderId;
  Order_detailsShimmer({Key? key, this.orderId}) : super(key: key);

  @override
  _Order_detailsShimmerState createState() => _Order_detailsShimmerState();
}

class _Order_detailsShimmerState extends State<Order_detailsShimmer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Order_details_bottom_bar(
            subTotal: '145',
            deliveryFee: '73',
            total: '240',
            orderID: 1,
            statusCode: 1,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //order id container

            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 15),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      "Ordered Foods",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ThemeColors.scaffoldBgColor),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 2),
                    ),
                    Card(
                      elevation: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          leading: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Container(
                              height: SizeConfig.screenWidth! / 5,
                              width: SizeConfig.screenWidth! / 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(Images.shimmerImage),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          title: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              'Burger',
                              style: TextStyle(
                                fontSize: FontSize.xMedium,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          subtitle: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              'Farmhous Burger',
                              style: TextStyle(
                                overflow: TextOverflow.fade,
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w300,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  '\$71',
                                  style: TextStyle(
                                    fontSize: FontSize.medium,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ]),
        ),
      ),
    );
  }

  Customer_details(OrderDetailsController orderDetails) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
          child: Row(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[400]!,
                  child: Icon(Icons.person_pin)),
              SizedBox(
                width: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[400]!,
                child: Text(
                  "Customer details",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ThemeColors.scaffoldBgColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 25),
          color: ThemeColors.off_white_Color,
          //height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      'Abdul',
                      style: TextStyle(color: Colors.transparent),
                    ),
                  ),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.person_pin))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      'USA',
                      style: TextStyle(color: Colors.transparent),
                    ),
                  ),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on_outlined))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      '017165416516',
                      style: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.phone_sharp))),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
