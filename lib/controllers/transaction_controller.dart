import 'dart:convert';

import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

import '../models/transactions_model.dart';

class TransactionsController extends GetxController {
  Server server = Server();
  List<TransactionsData> transactions = <TransactionsData>[];
  bool loader = true;
  @override
  void onInit() {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getTransactions();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTransactions() async {
    transactions.clear();
    server.getRequest(endPoint: APIList.transactions).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var transactionsData = TransactionsModel.fromJson(jsonResponse);
        transactions = <TransactionsData>[];
        transactions.addAll(transactionsData.data!);
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
}
