import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodbank_marchantise_app/controllers/global-controller.dart';
import 'package:foodbank_marchantise_app/controllers/order_details_controller.dart';
import 'package:foodbank_marchantise_app/models/status_order_id.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/widgets/order_detils_bottom_bar.dart';
import 'package:foodbank_marchantise_app/widgets/shimmer/oder_details_shimmer.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Order_details extends StatefulWidget {
  final int? orderId;
  Order_details({Key? key, this.orderId}) : super(key: key);

  @override
  _Order_detailsState createState() => _Order_detailsState();
}

class _Order_detailsState extends State<Order_details> {
  int statusValue = 0;
  int statusActive = 1;
  var orderStatusID;

  @override
  void initState() {
    // TODO: implement initState
    final orderDetailsController =
        Get.put(OrderDetailsController(widget.orderId));
    final settingsController = Get.put(GlobalController());
    orderDetailsController.onInit();
    settingsController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    var orderDetailsController =
        Get.put(OrderDetailsController(widget.orderId));
    final settingsController = Get.put(GlobalController());

    Future<Null> _onRefresh() {
      setState(() {
        orderDetailsController.onInit();
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _onRefresh();
      });
      Completer<Null> completer = new Completer<Null>();
      Timer(new Duration(seconds: 3), () {
        completer.complete();
      });
      return completer.future;
    }

    return GetBuilder<OrderDetailsController>(
        init: OrderDetailsController(widget.orderId),
        builder: (orderDetails) => orderDetails.loader
            ? Order_detailsShimmer()
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    "ORDER_DETAILS".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: ThemeColors.baseThemeColor,
                  centerTitle: true,
                  elevation: 0.0,
                ),
                bottomNavigationBar: Order_details_bottom_bar(
                  subTotal:
                      orderDetails.orderDetailsByIdData!.subTotal.toString(),
                  deliveryFee: orderDetails.orderDetailsByIdData!.deliveryCharge
                      .toString(),
                  total: orderDetails.orderDetailsByIdData!.total,
                  orderID: orderDetails.orderDetailsByIdData!.id,
                  statusCode: orderDetails.statusCode,
                ),
                body: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      statusActive = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: statusActive == 1
                                        ? BoxDecoration(
                                            color: ThemeColors.baseThemeColor,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          )
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.fromBorderSide(
                                              BorderSide(
                                                color:
                                                    ThemeColors.baseThemeColor,
                                              ),
                                            ),
                                          ),
                                    child: Center(
                                        child: Text('DETAILS'.tr,
                                            style: TextStyle(
                                                color: statusActive == 1
                                                    ? Colors.white
                                                    : ThemeColors
                                                        .baseThemeColor))),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      statusActive = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: statusActive == 2
                                        ? BoxDecoration(
                                            color: ThemeColors.baseThemeColor,
                                            borderRadius:
                                                BorderRadius.circular(40))
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.fromBorderSide(
                                              BorderSide(
                                                color:
                                                    ThemeColors.baseThemeColor,
                                              ),
                                            ),
                                          ),
                                    child: Center(
                                      child: Text(
                                        'TRACKING_ORDER'.tr,
                                        style: TextStyle(
                                          color: statusActive == 2
                                              ? Colors.white
                                              : ThemeColors.baseThemeColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          statusActive == 1
                              ? ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: [
                                      //order id container
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 1.0,
                                                      horizontal: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "ORDER_NO".tr +
                                                            " #${orderDetails.orderCode}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${Get.find<GlobalController>().currency!}${orderDetails.total}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          left: 15,
                                                          right: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      //order id
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "ORDER_NO".tr,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16
                                                                // color: Colors.grey
                                                                ),
                                                          ),
                                                          Text(
                                                            orderDetails
                                                                .statusName
                                                                .toString(),
                                                            style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              //fontWeight: FontWeight.w300,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey,
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
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16,
                                                              //    color: Colors.deepOrange
                                                            ),
                                                          ),
                                                          orderDetails.orderType ==
                                                                  2
                                                              ? Text(
                                                                  orderDetails
                                                                      .orderTypeName
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: ThemeColors
                                                                        .baseThemeColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        FontSize
                                                                            .xMedium,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  orderDetails
                                                                      .orderTypeName
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: ThemeColors
                                                                        .greenTextColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        FontSize
                                                                            .xMedium,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "ORDER".tr +
                                                            "${orderDetails.statusName}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${orderDetails.createdTime} ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 13,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        "ITEMS".tr +
                                                            " ${orderDetails.orderDetailsByIdData!.items!.length} ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //   Stepper
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, bottom: 10, left: 15),
                                            child: orderDetails
                                                        .orderDetailsByIdData!
                                                        .deliveryBoy!
                                                        .id ==
                                                    null
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Icon(Icons.person_pin),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "DELIVERY_BOY_DETAILS"
                                                            .tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            color: ThemeColors
                                                                .scaffoldBgColor),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          orderDetails.orderDetailsByIdData!
                                                      .deliveryBoy!.id ==
                                                  null
                                              ? Container()
                                              : Container(
                                                  width: SizeConfig.screenWidth,
                                                  child: Card(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 5,
                                                          right: 5),
                                                      child: Row(
                                                        children: [
                                                          //shop image container
                                                          CachedNetworkImage(
                                                            imageUrl: orderDetails
                                                                .orderDetailsByIdData!
                                                                .deliveryBoy!
                                                                .image
                                                                .toString(),
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                Container(
                                                                    width: SizeConfig
                                                                            .screenWidth! /
                                                                        4,
                                                                    height:
                                                                        SizeConfig.screenWidth! /
                                                                            4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              10.0),
                                                                          bottomLeft:
                                                                              Radius.circular(10.0)),
                                                                    ),
                                                                    child: Image(
                                                                        image:
                                                                            imageProvider)),
                                                            placeholder: (context,
                                                                    url) =>
                                                                Shimmer
                                                                    .fromColors(
                                                              baseColor: Colors
                                                                  .grey[300]!,
                                                              highlightColor:
                                                                  Colors.grey[
                                                                      400]!,
                                                              child: Container(
                                                                  width: SizeConfig
                                                                          .screenWidth! /
                                                                      4,
                                                                  height: SizeConfig
                                                                          .screenWidth! /
                                                                      4,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                10.0),
                                                                        bottomLeft:
                                                                            Radius.circular(10.0)),
                                                                  ),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          Images
                                                                              .shimmerImage))),
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),

                                                          //shop descrption container

                                                          orderDetails
                                                                      .orderDetailsByIdData!
                                                                      .deliveryBoy!
                                                                      .id ==
                                                                  null
                                                              ? Container()
                                                              : Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        orderDetails
                                                                            .orderDetailsByIdData!
                                                                            .deliveryBoy!
                                                                            .name
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                ThemeColors.scaffoldBgColor),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              orderDetails.orderDetailsByIdData!.deliveryBoy!.email.toString(),
                                                                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: ThemeColors.greyTextColor),
                                                                            ),
                                                                          ),
                                                                          Icon(Icons
                                                                              .email)
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            orderDetails.orderDetailsByIdData!.deliveryBoy!.phone.toString(),
                                                                            style: TextStyle(
                                                                                //color: Colors.white
                                                                                ),
                                                                          ),
                                                                          InkWell(
                                                                              onTap: (() {
                                                                                _makePhoneCall(orderDetails.orderDetailsByIdData!.deliveryBoy!.phone.toString());
                                                                              }),
                                                                              child: Icon(Icons.phone_enabled)),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 10, left: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "ORDERED_FOODS".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: ThemeColors
                                                      .scaffoldBgColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: orderDetails
                                            .orderDetailsByIdData!
                                            .items!
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //SizedBox(height: 20,),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    bottom: 2),
                                              ),
                                              Card(
                                                elevation: 1,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2),
                                                  child: ListTile(
                                                    leading: CachedNetworkImage(
                                                      imageUrl: orderDetails
                                                          .orderDetailsByIdData!
                                                          .items![index]
                                                          .menuItem!
                                                          .image!,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        height: SizeConfig
                                                                .screenWidth! /
                                                            5,
                                                        width: SizeConfig
                                                                .screenWidth! /
                                                            5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[300]!,
                                                        highlightColor:
                                                            Colors.grey[400]!,
                                                        child: Container(
                                                            width: SizeConfig
                                                                    .screenWidth! /
                                                                4,
                                                            height: SizeConfig
                                                                    .screenWidth! /
                                                                4,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10.0)),
                                                            ),
                                                            child: Image(
                                                                image: AssetImage(
                                                                    Images
                                                                        .shimmerImage))),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                    title: Text(
                                                      orderDetails
                                                          .orderDetailsByIdData!
                                                          .items![index]
                                                          .menuItem!
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize:
                                                            FontSize.xMedium,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      Get.find<GlobalController>()
                                                              .currency! +
                                                          orderDetails
                                                              .orderDetailsByIdData!
                                                              .items![index]
                                                              .unitPrice
                                                              .toString() +
                                                          ' X ' +
                                                          orderDetails
                                                              .orderDetailsByIdData!
                                                              .items![index]
                                                              .quantity
                                                              .toString() +
                                                          ' = ' +
                                                          Get.find<
                                                                  GlobalController>()
                                                              .currency! +
                                                          orderDetails
                                                              .orderDetailsByIdData!
                                                              .items![index]
                                                              .itemTotal
                                                              .toString(),
                                                      style: TextStyle(
                                                        overflow:
                                                            TextOverflow.fade,
                                                        fontSize:
                                                            FontSize.medium,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    trailing: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            Get.find<GlobalController>()
                                                                    .currency! +
                                                                orderDetails
                                                                    .orderDetailsByIdData!
                                                                    .items![
                                                                        index]
                                                                    .unitPrice
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontSize: FontSize
                                                                  .medium,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            orderDetails
                                                                .orderDetailsByIdData!
                                                                .timeFormat
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize:
                                                                    FontSize
                                                                        .medium,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      //support phone
                                      settingsController.supportPhone == null
                                          ? Container()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      bottom: 10,
                                                      left: 15),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                          FontAwesomeIcons
                                                              .phoneVolume,
                                                          color: ThemeColors
                                                              .baseThemeColor),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "SUPPORT_NUMBER".tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            color: ThemeColors
                                                                .scaffoldBgColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: SizeConfig.screenWidth,
                                                  child: Card(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 5,
                                                          right: 5),
                                                      child: Row(
                                                        children: [
                                                          //shop image container
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .headset,
                                                            color: ThemeColors
                                                                .baseThemeColor,
                                                            size: 40,
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),

                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'CALL_YOUR_SUPPORT'
                                                                      .tr,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16,
                                                                      color: ThemeColors
                                                                          .scaffoldBgColor),
                                                                ),
                                                                SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Text(
                                                                  '${settingsController.supportPhone.toString()}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontSize:
                                                                          14,
                                                                      color: ThemeColors
                                                                          .greyTextColor),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              _makePhoneCall(
                                                                  settingsController
                                                                      .supportPhone
                                                                      .toString());
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .phone_enabled,
                                                              color: ThemeColors
                                                                  .baseThemeColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ])
                              : Container(),

                          //order id container
                          statusActive == 2
                              ? ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: [
                                      orderDetails.orderStatusArray.length != 1
                                          ? Container(
                                              padding: EdgeInsets.only(
                                                  top: 20,
                                                  bottom: 10,
                                                  left: 15),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "UPDATE_STATUS".tr,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: ThemeColors
                                                            .scaffoldBgColor),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      //changing Status
                                      orderDetails.orderStatusArray.length != 1
                                          ? Container(
                                              height: 55,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .9,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                color: Color(0xFFF2F2F2),
                                              ),
                                              child: ButtonTheme(
                                                alignedDropdown: true,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<
                                                      OrderStatusArray>(
                                                    value: orderDetails
                                                        .orderStatusArray[0],
                                                    isExpanded: true,
                                                    icon: Icon(Icons
                                                        .keyboard_arrow_down),
                                                    iconEnabledColor:
                                                        ThemeColors
                                                            .baseThemeColor,
                                                    items: orderDetails
                                                        .orderStatusArray
                                                        .map((OrderStatusArray
                                                            value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(
                                                          value.name.toString(),
                                                          style: TextStyle(
                                                            color: ThemeColors
                                                                .baseThemeColor,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        orderStatusID =
                                                            newValue;
                                                        print(newValue!.name);
                                                        if (newValue.id != 0) {
                                                          showAlertCompletDialog(
                                                              context,
                                                              newValue,
                                                              widget.orderId,
                                                              orderDetails);
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(),

                                      Container(
                                        child: Theme(
                                          data: ThemeData(
                                            colorScheme:
                                                ColorScheme.fromSwatch()
                                                    .copyWith(
                                              primary:
                                                  ThemeColors.baseThemeColor,
                                            ),
                                          ),
                                          child: Stepper(
                                            physics: ClampingScrollPhysics(),
                                            controlsBuilder:
                                                (BuildContext context,
                                                    ControlsDetails controls) {
                                              return SizedBox(height: 0.0);
                                            },
                                            steps: getTrackingSteps(
                                                context,
                                                orderDetails.statusName,
                                                orderDetails.statusCode
                                                    .toString()),
                                            currentStep: statusValue,
                                          ),
                                        ),
                                      ),
                                    ])
                              : Container(),
                        ]),
                  ),
                ),
              ));
  }

  List<Step> getTrackingSteps(BuildContext context, statusName, status) {
    List<Step> _orderStatusSteps = [];
    if (status == '10') {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'ORDER_CANCEL'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
            )),
        isActive: int.tryParse(status)! >= int.tryParse('10')!,
      ));
    } else {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'ORDER_PENDING'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        isActive: int.tryParse(status)! >= int.tryParse('5')!,
      ));
    }
    if (status == '12') {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'ORDER_REJECT'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
            )),
        isActive: int.tryParse(status)! >= int.tryParse('12')!,
      ));
    } else {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'ORDER_ACCEPT'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        isActive: int.tryParse(status)! >= int.tryParse('14')!,
      ));
    }
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'ORDER_PROCESS'.tr,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('15')!,
    ));
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'ON_THE_WAY'.tr,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('17')!,
    ));
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'ORDER_COMPLETED'.tr,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('20')!,
    ));
    return _orderStatusSteps;
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  showAlertCompletDialog(
      BuildContext context, status, orderID, orderDetailsController) {
    Widget cancelButton = TextButton(
      child: Text("CANCEL".tr),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("YES".tr),
      onPressed: () {
        int? oId = int.parse(orderID.toString());
        orderDetailsController.orderStatus(status.id.toString(), oId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(status.name.toString()),
      content: Text("ARE_YOU_SURE_YOU_HAVE" +
          "${status.name.toString()}" +
          "THE_ORDER".tr),
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
