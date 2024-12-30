import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatefulWidget {
  const HomePageShimmer({Key? key}) : super(key: key);

  @override
  _HomePageShimmerState createState() => _HomePageShimmerState();
}

class _HomePageShimmerState extends State<HomePageShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
          width: SizeConfig.screenWidth,
          //height: SizeConfig.screenHeight!/3.5,
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Icon(Icons.access_time)),
                            SizedBox(
                              width: 10,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[400]!,
                              child: Text(
                                '12 hours',
                                style: TextStyle(color: Colors.transparent),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //  elevation: 0.0,
                                      backgroundColor:
                                          Colors.transparent, // background
                                      // foreground
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[400]!,
                                      child: Text(
                                        'ACCEPT'.tr,
                                        style: TextStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Container(
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //  elevation: 0.0,
                                      backgroundColor:
                                          Colors.transparent, // background
                                      foregroundColor:
                                          Colors.white, // foreground
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[400]!,
                                      child: Text(
                                        'REJECT'.tr,
                                        style: TextStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Divider(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      child: Row(
                        children: [
                          //order id
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              "Order Id: #",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.transparent),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              '#39',
                              style: TextStyle(
                                color: Colors.transparent,
                                fontSize: FontSize.xMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              "Time: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.transparent),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              '12-12-2021',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                //fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.transparent,
                                fontFamily: 'AirbnbCerealBold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              "Payment mode: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.transparent),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              'Stripe',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                // fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.transparent,
                                fontFamily: 'AirbnbCerealBold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              elevation: 1,
              // shadowColor: Colors.blueGrey,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(
                  width: 0.05,
                ),
              ))),
    );
  }
}
