import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/models/withdraw_model.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

import '../models/request_withdraw_model.dart';
import '../views/main_screen.dart';

class WithdrawController extends GetxController {
  Server server = Server();
  List<WithdrawData> withdraws = <WithdrawData>[];
  List<RequestWithdraws> requestWithdraws = <RequestWithdraws>[];
  String? totalBalance = '0.00',
      orderBalance = '0.00',
      requestedAmount = '0.00',
      withdrawAmount = '0.00';
  bool loader = true;
  @override
  void onInit() {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getWithdraw();
    getRequestWithdraw();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getWithdraw() async {
    withdraws.clear();
    server.getRequest(endPoint: APIList.withdraw).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var withdrawsData = WithdrawModel.fromJson(jsonResponse);
        withdraws = <WithdrawData>[];
        withdraws.addAll(withdrawsData.data!);
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  getRequestWithdraw() async {
    requestWithdraws.clear();
    server.getRequest(endPoint: APIList.requestWithdraw).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var requestWithdrawsData = RequestWithdrawModel.fromJson(jsonResponse);

        requestWithdraws = <RequestWithdraws>[];
        requestWithdraws.addAll(requestWithdrawsData.data!.requestWithdraws!);
        totalBalance = requestWithdrawsData.data!.balance!.totalBalance!;
        orderBalance = requestWithdrawsData.data!.balance!.orderBalance!;
        withdrawAmount = requestWithdrawsData.data!.balance!.withdrawAmount!;
        requestedAmount = requestWithdrawsData.data!.balance!.requestedAmount!;
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  addRequest(amount, dateWithdraw) async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });

    var body = {
      "amount": amount != null ? amount : '',
      "date": dateWithdraw != null ? dateWithdraw : '',
    };
    String jsonStr = jsonEncode(body);
    print(jsonStr);
    server
        .postRequestWithToken(
            endPoint: APIList.requestWithdrawPost!, body: jsonStr)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse['message']);

      if (response != null && response.statusCode == 200) {
        Get.rawSnackbar(
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            message: jsonResponse['message']);
        Get.off(MainScreen());
        getWithdraw();
        getRequestWithdraw();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['message'].containsKey('amount')) {
          Get.rawSnackbar(
              backgroundColor: Colors.black,
              snackPosition: SnackPosition.TOP,
              message: jsonResponse['message']['amount'][0]);
        } else if (jsonResponse['message'].containsKey('date')) {
          Get.rawSnackbar(
              backgroundColor: Colors.black,
              snackPosition: SnackPosition.TOP,
              message: jsonResponse['message']['date'][0]);
        } else {
          Get.rawSnackbar(
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP,
              message: 'Please enter valid input');
        }

        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
            message: 'Please enter valid input');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  updateRequest(id, amount, dateWithdraw) async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });

    var body = {
      "amount": amount != null ? amount : '',
      "date": dateWithdraw != null ? dateWithdraw : '',
    };
    String jsonStr = jsonEncode(body);
    print(jsonStr);
    server
        .putRequest(
            endPoint: APIList.requestWithdraw! + '/' + id.toString(),
            body: jsonStr)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse['message']);

      if (response != null && response.statusCode == 200) {
        Get.rawSnackbar(
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            message: jsonResponse['message']);
        Get.off(MainScreen());
        getWithdraw();
        getRequestWithdraw();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['message'].containsKey('amount')) {
          Get.rawSnackbar(
              backgroundColor: Colors.black,
              snackPosition: SnackPosition.TOP,
              message: jsonResponse['message']['amount'][0]);
        } else if (jsonResponse['message'].containsKey('date')) {
          Get.rawSnackbar(
              backgroundColor: Colors.black,
              snackPosition: SnackPosition.TOP,
              message: jsonResponse['message']['date'][0]);
        } else {
          Get.rawSnackbar(
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP,
              message: 'Please enter valid input');
        }

        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
            message: 'Please enter valid input');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
