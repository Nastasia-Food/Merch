import 'dart:convert';

import 'package:foodbank_marchantise_app/models/order_details.dart';
import 'package:foodbank_marchantise_app/models/status_order_id.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  Server server = Server();
  var orderId;
  bool loader = true;
  OrderDetailsByIdData? orderDetailsByIdData;
  List<OrderStatusArray> orderStatusArray = <OrderStatusArray>[];
  int? statusCode;
  String? statusName;
  int? orderType;
  String? orderTypeName;
  String? createdTime;
  String? orderCode;
  String? total;

  OrderDetailsController(this.orderId);

  @override
  void onInit() {
    loader = true;
    getAllOrderDetaisById(orderId);
    getStatusOrderId(orderId);
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllOrderDetaisById(var id) async {
    server.getRequestWithParam(orderId: id).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var idWiseOrderDetailsData = OrderDetails.fromJson(jsonResponse);
        print(jsonResponse);
        orderDetailsByIdData = idWiseOrderDetailsData.data!.data!;
        statusCode = orderDetailsByIdData!.status!;
        orderCode = orderDetailsByIdData!.orderCode!;
        total = orderDetailsByIdData!.total!;
        createdTime = orderDetailsByIdData!.updatedAt!;
        statusName = orderDetailsByIdData!.statusName!;
        orderType = orderDetailsByIdData!.orderType!;
        orderTypeName = orderDetailsByIdData!.orderTypeName!;
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

  changeStatus(status, id) async {
    loader = true;
    update();
    print(">>>>>>>>>>>>>>>>Status tapped");
    print(id);
    var jsonMap = {
      'product_receive_status': int.parse(status),
    };
    String jsonStr = jsonEncode(jsonMap);
    server
        .putRequest(
            endPoint:
                APIList.notificationOrderUpdate! + id.toString() + '/update',
            body: jsonStr)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        print('okokoookokokokook');
        onInit();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        Get.rawSnackbar(message: 'Please enter valid input');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  getStatusOrderId(id) async {
    print('okokoko');
    server
        .getRequest(endPoint: APIList.statusOrderId! + id.toString())
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var orderListData = StatusOrderId.fromJson(jsonResponse);
        orderStatusArray = <OrderStatusArray>[];
        orderStatusArray.add(OrderStatusArray(id: 0, name: 'Change status'));
        orderStatusArray.addAll(orderListData.data!.orderStatusArray!);
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  orderStatus(status, id) async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    print(id);
    var jsonMap = {
      'status': int.parse(status),
    };
    String jsonStr = jsonEncode(jsonMap);
    server
        .putRequest(
            endPoint: APIList.OrderStatusUpdate! + id.toString(), body: jsonStr)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        onInit();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please try');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
