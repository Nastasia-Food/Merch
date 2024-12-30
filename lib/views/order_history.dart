import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/order_history_controller.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/widgets/shimmer/home_page_shimmer.dart';
import 'package:get/get.dart';

import '../controllers/global-controller.dart';
import 'no_order_order_history.dart';
import 'order_details.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({Key? key}) : super(key: key);

  @override
  _OrderhistoryState createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  final orderHistoryController = Get.put(OrderHistoryController());

  @override
  void initState() {
    orderHistoryController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      orderHistoryController.onInit();
    });
    return GetBuilder<OrderHistoryController>(
      init: OrderHistoryController(),
      builder: (ordersHistory) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColors.baseThemeColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ORDEDRS_HISTORY'.tr,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        body: ordersHistory.loader
            ? HomePageShimmer()
            : RefreshIndicator(
                onRefresh: _refresh,
                child: ordersHistory.orderHistoryList.length < 1
                    ? NoOrderFoundOrderHistory(
                        "NO_ORDER".tr, Images.noOrderFound)
                    : ListView.builder(
                        itemCount: ordersHistory.orderHistoryList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (() {
                              Get.to(Order_details(
                                  orderId: ordersHistory
                                      .orderHistoryList[index].id));
                            }),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2.5),
                                width: SizeConfig.screenWidth,
                                //height: SizeConfig.screenHeight!/3.5,
                                child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.access_time),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(ordersHistory
                                                      .orderHistoryList[index]
                                                      .timeFormat
                                                      .toString()),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ordersHistory
                                                      .orderHistoryList[index]
                                                      .statusName
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Divider(),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                  left: 5,
                                                  right: 5),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        //order id
                                                        Text(
                                                          "ORDER_NO#".tr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            //    color: Colors.deepOrange
                                                          ),
                                                        ),
                                                        Text(
                                                          ordersHistory
                                                              .orderHistoryList[
                                                                  index]
                                                              .orderCode
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: ThemeColors
                                                                .baseThemeColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: FontSize
                                                                .xMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        //order id
                                                        Text(
                                                          "TOTAL".tr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            //    color: Colors.deepOrange
                                                          ),
                                                        ),
                                                        Text(
                                                          Get.find<GlobalController>()
                                                                  .currency! +
                                                              ordersHistory
                                                                  .orderHistoryList[
                                                                      index]
                                                                  .total
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color: ThemeColors
                                                                .scaffoldBgColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: FontSize
                                                                .xMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ])),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 5, right: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                //order id
                                                Row(
                                                  children: [
                                                    Text(
                                                      "TIME".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16
                                                          // color: Colors.grey
                                                          ),
                                                    ),
                                                    Text(
                                                      ordersHistory
                                                          .orderHistoryList[
                                                              index]
                                                          .createdAt
                                                          .toString(),
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        //fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: Colors.grey,
                                                        fontFamily:
                                                            'AirbnbCerealBold',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //total amount
                                                Row(
                                                  children: [
                                                    Text(
                                                      "TYPE".tr,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                        //    color: Colors.deepOrange
                                                      ),
                                                    ),
                                                    ordersHistory
                                                                .orderHistoryList[
                                                                    index]
                                                                .orderType ==
                                                            2
                                                        ? Text(
                                                            ordersHistory
                                                                .orderHistoryList[
                                                                    index]
                                                                .orderTypeName
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: ThemeColors
                                                                  .baseThemeColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: FontSize
                                                                  .xMedium,
                                                            ),
                                                          )
                                                        : Text(
                                                            ordersHistory
                                                                .orderHistoryList[
                                                                    index]
                                                                .orderTypeName
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: ThemeColors
                                                                  .greenTextColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: FontSize
                                                                  .xMedium,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "PAYMENT_MODE".tr,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,

                                                    fontSize: 16,
                                                    // color: Colors.grey
                                                  ),
                                                ),
                                                Text(
                                                  ordersHistory
                                                      .orderHistoryList[index]
                                                      .paymentMethodName
                                                      .toString(),
                                                  style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    // fontWeight: FontWeight.w300,
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontFamily:
                                                        'AirbnbCerealBold',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      side: BorderSide(
                                        width: 0.05,
                                      ),
                                    ))),
                          );
                        }),
              ),
      ),
    );
  }

  Future<Null> _refresh() async {
    print('refreshing stocks...');
    orderHistoryController.onInit();
    await Future.delayed(new Duration(seconds: 3));
  }
}
