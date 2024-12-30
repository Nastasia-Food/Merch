// To parse this JSON data, do
//
//     final statusOrderId = statusOrderIdFromJson(jsonString);

import 'dart:convert';

StatusOrderId statusOrderIdFromJson(String str) => StatusOrderId.fromJson(json.decode(str));

String statusOrderIdToJson(StatusOrderId data) => json.encode(data.toJson());

class StatusOrderId {
  StatusOrderId({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory StatusOrderId.fromJson(Map<String, dynamic> json) => StatusOrderId(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.showStatus,
    this.showReceive,
    this.orderStatusArray,
  });

  bool? showStatus;
  bool? showReceive;
  List<OrderStatusArray>? orderStatusArray;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    showStatus: json["showStatus"],
    showReceive: json["showReceive"],
    orderStatusArray: List<OrderStatusArray>.from(json["orderStatusArray"].map((x) => OrderStatusArray.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "showStatus": showStatus,
    "showReceive": showReceive,
    "orderStatusArray": List<dynamic>.from(orderStatusArray!.map((x) => x.toJson())),
  };
}

class OrderStatusArray {
  OrderStatusArray({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory OrderStatusArray.fromJson(Map<String, dynamic> json) => OrderStatusArray(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
