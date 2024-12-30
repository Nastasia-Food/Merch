import 'dart:convert';
import 'package:foodbank_marchantise_app/models/restaurant_order_history.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  Server server = Server();
  List<RestaurantOrderData> orderHistoryList = <RestaurantOrderData>[];
  int? len;
  bool loader = true;

  @override
  void onInit() {
    loader = true;
    getAllOrdersHistory();
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllOrdersHistory() async {
    server
        .getRequest(endPoint: APIList.notificationOrderHistory)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var orderHistoryListData =
            RestaurantOrderHistory.fromJson(jsonResponse);
        orderHistoryList = <RestaurantOrderData>[];
        print(orderHistoryListData);
        orderHistoryList.addAll(orderHistoryListData.data!);
        len = orderHistoryList.length;
        print(len);
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
