import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/global-controller.dart';
import 'package:foodbank_marchantise_app/controllers/notification_order_controller.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/views/order_details.dart';
import 'package:get/get.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String acceptDialogue = "ARE_YOU_SURE_YOU_WANT_TO_ACCEPT_THE_ORDER".tr;
  String processDialogue = "ARE_YOU_SURE_YOU_WANT_TO_PROCESS_THE_ORDER".tr;
  String completedDialogue = "ARE_YOU_SURE_YOU_WANT_TO_COMPLETED_THE_ORDER".tr;
  String cancelDialogue = "ARE_YOU_SURE_YOU_WANT_TO_CANCEL_THE_ORDER".tr;
  String DialogueAccpet = "ORDER_ACCEPT?".tr;
  String DialogueProcess = "ORDER_PROCESS?".tr;
  String DialogueCompleted = "ORDER_COMPLETED?".tr;
  String DialogueCancel = "ORDER_CANCEL?".tr;
  final order_Controller = Get.put(OrderListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      order_Controller.onInit();
    });
    return GetBuilder<OrderListController>(
      init: OrderListController(),
      builder: (orders) => Expanded(
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: orders.orderList.length,
            itemBuilder: (context, index) {
              return Container(
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
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(orders.orderList[index].timeFormat
                                        .toString()),
                                  ],
                                ),
                                orders.orderList[index].status == 5
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 5, left: 5),
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  //  elevation: 0.0,
                                                  backgroundColor: Colors
                                                      .green, // background
                                                  // foreground
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // <-- Radius
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    showAlertDialog(
                                                        context,
                                                        DialogueAccpet,
                                                        acceptDialogue,
                                                        '14',
                                                        orders
                                                            .orderList[index].id
                                                            .toString());
                                                  });
                                                },
                                                child: Text(
                                                  'ACCEPT'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  //  elevation: 0.0,
                                                  foregroundColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.red, // foreground
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // <-- Radius
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    showAlertDialog(
                                                        context,
                                                        DialogueCancel,
                                                        cancelDialogue,
                                                        '10',
                                                        orders
                                                            .orderList[index].id
                                                            .toString());
                                                  });
                                                },
                                                child: Text(
                                                  'REJECT'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            orders.orderList[index].status == 14
                                                ? Container(
                                                    padding: EdgeInsets.only(
                                                        right: 5),
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //  elevation: 0.0,
                                                        backgroundColor: Colors
                                                            .green, // background
                                                        // foreground
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10), // <-- Radius
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        if (orders
                                                                .orderList[
                                                                    index]
                                                                .orderType ==
                                                            1) {
                                                          showAlertDialog(
                                                              context,
                                                              DialogueProcess,
                                                              processDialogue,
                                                              '15',
                                                              orders
                                                                  .orderList[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                        } else {
                                                          showAlertDialog(
                                                              context,
                                                              DialogueCompleted,
                                                              completedDialogue,
                                                              '20',
                                                              orders
                                                                  .orderList[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                        }
                                                      },
                                                      child: orders
                                                                  .orderList[
                                                                      index]
                                                                  .orderType ==
                                                              1
                                                          ? Text(
                                                              'PROCESS'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : Text(
                                                              'COMPLETED'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      )
                              ],
                            ),
                            InkWell(
                              onTap: () => Get.to(() => Order_details(
                                    orderId: orders.orderList[index].id,
                                  )),
                              child: Column(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //order id
                                      Row(
                                        children: [
                                          Text(
                                            "ORDER_NO#".tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              //    color: Colors.deepOrange
                                            ),
                                          ),
                                          Text(
                                            orders.orderList[index].orderCode!
                                                .toString(),
                                            style: TextStyle(
                                              color:
                                                  ThemeColors.scaffoldBgColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize.xMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //total amount
                                      Row(
                                        children: [
                                          Text(
                                            "TOTAL".tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              //    color: Colors.deepOrange
                                            ),
                                          ),
                                          Text(
                                            Get.find<GlobalController>()
                                                    .currency! +
                                                orders.orderList[index].total
                                                    .toString(),
                                            style: TextStyle(
                                              color:
                                                  ThemeColors.scaffoldBgColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize.xMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //order id
                                      Row(
                                        children: [
                                          Text(
                                            "TIME".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16
                                                // color: Colors.grey
                                                ),
                                          ),
                                          Text(
                                            orders.orderList[index].createdAt
                                                .toString(),
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              //fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontFamily: 'AirbnbCerealBold',
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
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              //    color: Colors.deepOrange
                                            ),
                                          ),
                                          orders.orderList[index].orderType == 2
                                              ? Text(
                                                  orders.orderList[index]
                                                      .orderTypeName
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: ThemeColors
                                                        .baseThemeColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: FontSize.xMedium,
                                                  ),
                                                )
                                              : Text(
                                                  orders.orderList[index]
                                                      .orderTypeName
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: ThemeColors
                                                        .greenTextColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: FontSize.xMedium,
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
                                        orders
                                            .orderList[index].paymentMethodName
                                            .toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          // fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: 'AirbnbCerealBold',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ]),
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
                      )));
            }),
      ),
    );
  }

  //shhow alertDialogue

  showAlertDialog(
      BuildContext context, dialogueAccpet, String alertMessage, status, id) {
    int? oId = int.parse(id);

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("CANCEL".tr),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("CONTINUE".tr),
      onPressed: () {
        order_Controller.changeStatus(status, id);
        Navigator.of(context).pop();
        Get.to(() => Order_details(orderId: oId));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(dialogueAccpet),
      content: Text(alertMessage),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
