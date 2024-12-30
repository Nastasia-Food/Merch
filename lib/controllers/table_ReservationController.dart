import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:foodbank_marchantise_app/models/table_reservation.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TableReservationsController extends GetxController {
  Server server = Server();
  List<ReservationDatum> reservationsList = <ReservationDatum>[];
  bool tableReservationLoader = true;
  @override
  void onInit() {
    tableReservationLoader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getAllReservations();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllReservations() async {
    server.getRequest(endPoint: APIList.reservation).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var reservationData = TableReservation.fromJson(jsonResponse);
        reservationsList = <ReservationDatum>[];
        reservationsList.addAll(reservationData.data!.data!);
        print(reservationsList);
        print(reservationsList.length);
        tableReservationLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        tableReservationLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  changeReservationStatus(status, id) async {
    tableReservationLoader = true;
    print(">>>>>>>>>>>>>>>>Status tapped");
    var jsonMap = {
      'status': int.parse(status),
    };
    String jsonStr = jsonEncode(jsonMap);
    server
        .putRequest(endPoint: APIList.reservationStatus! + id, body: jsonStr)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        onInit();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });

        status == "2"
            ? Fluttertoast.showToast(
                msg: "Order Accepted",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: ThemeColors.baseThemeColor,
                textColor: Colors.white,
                fontSize: 16.0)
            : Fluttertoast.showToast(
                msg: "Order Rejected",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: ThemeColors.baseThemeColor,
                textColor: Colors.white,
                fontSize: 16.0);
      } else {
        tableReservationLoader = false;
        Get.rawSnackbar(message: 'Please enter valid input');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
