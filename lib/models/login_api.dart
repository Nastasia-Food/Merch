// To parse this JSON data, do
//
//     final loginApi = loginApiFromJson(jsonString);

import 'dart:convert';

LoginApi loginApiFromJson(String str) => LoginApi.fromJson(json.decode(str));

String loginApiToJson(LoginApi data) => json.encode(data.toJson());

class LoginApi {
  LoginApi({
    this.status,
    this.message,
    this.data,
    this.token,
    this.restaurant,
  });

  int? status;
  String? message;
  Data? data;
  String? token;
  Restaurant? restaurant;

  factory LoginApi.fromJson(Map<String, dynamic> json) => LoginApi(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
    "token": token,
    "restaurant": restaurant!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.username,
    this.image,
    this.address,
    this.status,
    this.applied,
    this.myrole,
    this.mystatus,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? username;
  String? image;
  String? address;
  int? status;
  int? applied;
  String? myrole;
  String? mystatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    image: json["image"],
    address: json["address"],
    status: json["status"],
    applied: json["applied"],
    myrole: json["myrole"],
    mystatus: json["mystatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "image": image,
    "address": address,
    "status": status,
    "applied": applied,
    "myrole": myrole,
    "mystatus": mystatus,
  };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.userId,
    this.description,
    this.deliveryCharge,
    this.lat,
    this.long,
    this.openingTime,
    this.closingTime,
    this.address,
    this.tableStatus,
    this.status,
    this.currentStatus,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.logo,
    this.cuisines,
  });

  int? id;
  String? name;
  int? userId;
  String? description;
  int? deliveryCharge;
  String? lat;
  String? long;
  String? openingTime;
  String? closingTime;
  String? address;
  int? tableStatus;
  String? status;
  String? currentStatus;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? logo;
  List<dynamic>? cuisines;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    description: json["description"],
    deliveryCharge: json["delivery_charge"],
    lat: json["lat"],
    long: json["long"],
    openingTime: json["opening_time"],
    closingTime: json["closing_time"],
    address: json["address"],
    tableStatus: json["table_status"],
    status: json["status"],
    currentStatus: json["current_status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    image: json["image"],
    logo: json["logo"],
    cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "description": description,
    "delivery_charge": deliveryCharge,
    "lat": lat,
    "long": long,
    "opening_time": openingTime,
    "closing_time": closingTime,
    "address": address,
    "table_status": tableStatus,
    "status": status,
    "current_status": currentStatus,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "image": image,
    "logo": logo,
    "cuisines": List<dynamic>.from(cuisines!.map((x) => x)),
  };
}
