import 'dart:convert';
import 'package:foodbank_marchantise_app/models/status_order_id.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

class StatusOrderIdController extends GetxController {
  Server server = Server();
  List<OrderStatusArray> orderStatusArray = <OrderStatusArray>[];
  int? len;
  bool loader = true;
  int id;

  StatusOrderIdController(this.id);

  @override
  void onInit() {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getStatusOrderId(id);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getStatusOrderId(id) async {
    server.getRequest(endPoint: APIList.statusOrderId! + id).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var orderListData = StatusOrderId.fromJson(jsonResponse);
        orderStatusArray = <OrderStatusArray>[];
        orderStatusArray.addAll(orderListData.data!.orderStatusArray!);
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
