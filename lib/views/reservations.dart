import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/table_ReservationController.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/widgets/shimmer/table_reservation_shimmer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'no_order_order_history.dart';

class Reservations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Reservations_State();
  }
}

class _Reservations_State extends State<Reservations> {
  var mainHeight, mainWidth;
  String acceptDialogue = "ARE_YOU_SURE_WANT_TO_ACCEPT_THE_RESERVATION".tr;
  String cancelDialogue = "ARE_YOU_SURE_YOU_WANT_TO_CANCLE_THE_RESERVATION".tr;
  String DialogueAccpet = "RESERVATION_ACCEPT".tr;
  String DialogueCancel = "RESERVATION_CANCEL".tr;

  final table_reservation_controller = Get.put(TableReservationsController());

  @override
  void initState() {
    table_reservation_controller.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return GetBuilder<TableReservationsController>(
      init: TableReservationsController(),
      builder: (tbcntlr) => tbcntlr.tableReservationLoader
          ? TableReservationShimmer()
          : Scaffold(
              backgroundColor: Colors.white10,
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  'TABLE_RESERVATIONS'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                backgroundColor: ThemeColors.baseThemeColor,
              ),
              body: RefreshIndicator(
                onRefresh: _refresh,
                child: tbcntlr.reservationsList.length < 1
                    ? NoOrderFoundOrderHistory(
                        "NO_RESERVATION".tr, Images.tableLogo1)
                    : ListView.builder(
                        itemCount: tbcntlr.reservationsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Stack(children: [
                              Card(
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        Colors.black, // here for close state
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.black,
                                    ), // here for open state in replacement of deprecated accentColor
                                    dividerColor: Colors
                                        .transparent, // if you want to remove the border
                                  ),
                                  child: ExpansionTile(
                                    key: Key(index.toString()), //attention
                                    initiallyExpanded: index == 0,
                                    title: Container(
                                      //  padding: const EdgeInsets.only(left: 10.0),
                                      width: mainWidth,
                                      height: mainHeight / 8,
                                      child: Row(
                                        children: [
                                          //image_container
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            width: mainWidth / 6,
                                            height: mainHeight / 12,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  tbcntlr
                                                              .reservationsList[
                                                                  index]
                                                              .guest! >=
                                                          3
                                                      ? "assets/images/table1.png"
                                                      : "assets/images/table2.png",
                                                ),
                                                fit: BoxFit.fill,
                                                //alignment: Alignment.topCenter,
                                              ),
                                            ),
                                          ),

                                          // Description container
                                          Expanded(
                                            child: Container(
                                              //  color: Colors.green,

                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '${tbcntlr.reservationsList[index].table}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        " ${tbcntlr.reservationsList[index].reservationDate} ",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //expanded container
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20.0,
                                            left: 20,
                                            top: 10,
                                            right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${tbcntlr.reservationsList[index].name} ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.person_pin,
                                                  color: ThemeColors
                                                      .baseThemeColor,
                                                  size: 27,
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${tbcntlr.reservationsList[index].email} ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (() {}),
                                                  child: Icon(
                                                    Icons.email_outlined,
                                                    color: ThemeColors
                                                        .baseThemeColor,
                                                    size: 27,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${tbcntlr.reservationsList[index].phone} ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (() {
                                                    _makePhoneCall(tbcntlr
                                                        .reservationsList[index]
                                                        .phone
                                                        .toString());
                                                  }),
                                                  child: Icon(
                                                    Icons.phone_enabled,
                                                    color: ThemeColors
                                                        .baseThemeColor,
                                                    size: 27,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "NO_OF_GUEST".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "${tbcntlr.reservationsList[index].guest} ",
                                                      style: TextStyle(
                                                          //  color: Colors.grey,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.supervised_user_circle,
                                                  color: ThemeColors
                                                      .baseThemeColor,
                                                  size: 27,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  "${tbcntlr.reservationsList[index].slot} ",
                                                  style: TextStyle(
                                                      // color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                                Icon(
                                                  Icons.access_time_sharp,
                                                  color: ThemeColors
                                                      .baseThemeColor,
                                                  size: 27,
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),
                                            //button row
                                            tbcntlr.reservationsList[index]
                                                        .status ==
                                                    1
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width:
                                                              mainWidth / 2.5,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 5),
                                                          height: 30,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //  elevation: 0.0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .green, // background
                                                              // foreground
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10), // <-- Radius
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                showAlertDialog(
                                                                    context,
                                                                    DialogueAccpet,
                                                                    acceptDialogue,
                                                                    '2',
                                                                    tbcntlr
                                                                        .reservationsList[
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                              });
                                                            },
                                                            child: Text(
                                                              'ACCEPT'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              mainWidth / 2.5,
                                                          height: 30,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //  elevation: 0.0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .red, // background
                                                              foregroundColor:
                                                                  Colors
                                                                      .white, // foreground
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10), // <-- Radius
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                showAlertDialog(
                                                                    context,
                                                                    DialogueCancel,
                                                                    cancelDialogue,
                                                                    '4',
                                                                    tbcntlr
                                                                        .reservationsList[
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                              });
                                                            },
                                                            child: Text(
                                                              'REJECT'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1,
                                left: MediaQuery.of(context).size.width / 2.8,
                                child: Center(
                                  child: Container(
                                    height: 25,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: tbcntlr.reservationsList[index]
                                                  .status !=
                                              2
                                          ? ThemeColors.baseThemeColor
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(
                                      child: Text(
                                        tbcntlr
                                            .reservationsList[index].status_name
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          );
                        },
                      ),
              ),
            ),
    );
  }

  Future<Null> _refresh() async {
    print('refreshing stocks...');
    table_reservation_controller.onInit();
    await Future.delayed(new Duration(seconds: 3));
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

  showAlertDialog(
      BuildContext context, dialogueAccpet, String alertMessage, status, id) {
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
        table_reservation_controller.changeReservationStatus(status, id);
        Navigator.of(context).pop();
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
