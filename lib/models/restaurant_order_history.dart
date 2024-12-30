// To parse this JSON data, do
//
//     final restaurantOrderHistory = restaurantOrderHistoryFromJson(jsonString);

import 'dart:convert';

RestaurantOrderHistory restaurantOrderHistoryFromJson(String str) =>
    RestaurantOrderHistory.fromJson(json.decode(str));

String restaurantOrderHistoryToJson(RestaurantOrderHistory data) =>
    json.encode(data.toJson());

class RestaurantOrderHistory {
  RestaurantOrderHistory({
    this.status,
    this.data,
  });

  int? status;
  List<RestaurantOrderData>? data;

  factory RestaurantOrderHistory.fromJson(Map<String, dynamic> json) =>
      RestaurantOrderHistory(
        status: json["status"],
        data: List<RestaurantOrderData>.from(
            json["data"].map((x) => RestaurantOrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RestaurantOrderData {
  RestaurantOrderData({
    this.id,
    this.userId,
    this.orderCode,
    this.total,
    this.subTotal,
    this.deliveryCharge,
    this.platform,
    this.deviceId,
    this.ip,
    this.status,
    this.statusName,
    this.orderType,
    this.orderTypeName,
    this.paymentStatus,
    this.paymentMethod,
    this.paymentMethodName,
    this.paidAmount,
    this.address,
    this.invoiceId,
    this.deliverBoyId,
    this.restaurantId,
    this.productReceived,
    this.mobile,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.timeFormat,
    this.date,
  });

  int? id;
  int? userId;
  String? orderCode;
  String? total;
  String? subTotal;
  String? deliveryCharge;
  dynamic platform;
  dynamic deviceId;
  dynamic ip;
  int? status;
  String? statusName;
  String? orderTypeName;
  int? orderType;
  int? paymentStatus;
  int? paymentMethod;
  String? paymentMethodName;
  String? paidAmount;
  String? address;
  String? invoiceId;
  dynamic deliverBoyId;
  int? restaurantId;
  int? productReceived;
  String? mobile;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;
  String? timeFormat;
  String? date;

  factory RestaurantOrderData.fromJson(Map<String, dynamic> json) =>
      RestaurantOrderData(
        id: json["id"],
        userId: json["user_id"],
        orderCode: json["order_code"].toString(),
        total: json["total"],
        subTotal: json["sub_total"],
        deliveryCharge: json["delivery_charge"],
        platform: json["platform"],
        deviceId: json["device_id"],
        ip: json["ip"],
        status: json["status"],
        statusName: json["status_name"],
        orderType: int.parse(json["order_type"].toString()),
        orderTypeName: json["order_type_name"],
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        paymentMethodName: json["payment_method_name"],
        paidAmount: json["paid_amount"],
        address: json["address"],
        invoiceId: json["invoice_id"],
        deliverBoyId: json["deliver_boy_id"],
        restaurantId: json["restaurant_id"],
        productReceived: json["product_received"],
        mobile: json["mobile"],
        lat: json["lat"],
        long: json["long"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        timeFormat: json["time_format"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_code": orderCode,
        "total": total,
        "sub_total": subTotal,
        "delivery_charge": deliveryCharge,
        "platform": platform,
        "device_id": deviceId,
        "ip": ip,
        "status": status,
        "status_name": statusName,
        "order_type": orderType,
        "order_type_name": orderTypeName,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "payment_method_name": paymentMethodName,
        "paid_amount": paidAmount,
        "address": address,
        "invoice_id": invoiceId,
        "deliver_boy_id": deliverBoyId,
        "restaurant_id": restaurantId,
        "product_received": productReceived,
        "mobile": mobile,
        "lat": lat,
        "long": long,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "time_format": timeFormat,
        "date": date,
      };
}
