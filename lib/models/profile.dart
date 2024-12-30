// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.data,
  });

  ProfileData? data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ProfileData {
  ProfileData({
    this.status,
    this.data,
  });

  int? status;
  DataData? data;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        status: json["status"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class DataData {
  DataData({
    this.id,
    this.email,
    this.username,
    this.phone,
    this.address,
    this.name,
    this.status,
    this.applied,
    this.totalOrders,
    this.totalReservations,
    this.image,
    this.myrole,
    this.balance,
    this.depositAmount,
    this.limitAmount,
    this.mystatus,
    this.restaurant,
  });

  int? id;
  String? email;
  String? username;
  String? phone;
  String? address;
  String? name;
  int? status;
  int? applied;
  int? totalOrders;
  int? totalReservations;
  String? image;
  String? myrole;
  String? balance;
  String? depositAmount;
  String? limitAmount;
  String? mystatus;
  Restaurant? restaurant;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        address: json["address"],
        name: json["name"],
        status: json["status"],
        applied: json["applied"],
        totalOrders: json["totalOrders"],
        totalReservations: json["totalReservations"],
        image: json["image"],
        myrole: json["myrole"],
        balance: json["balance"],
        depositAmount: json["deposit_amount"],
        limitAmount: json["limit_amount"],
        mystatus: json["mystatus"],
        restaurant: json["restaurant"].isEmpty
            ? Restaurant(
                id: null,
                name: null,
                userId: null,
                description: null,
                deliveryCharge: null,
                lat: null,
                long: null,
                openingTime: null,
                closingTime: null,
                address: null,
                tableStatus: null,
                status: null,
                currentStatus: null,
                createdAt: null,
                updatedAt: null,
                image: null,
                logo: null,
              )
            : Restaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "phone": phone,
        "address": address,
        "name": name,
        "status": status,
        "applied": applied,
        "totalOrders": totalOrders,
        "totalReservations": totalReservations,
        "image": image,
        "myrole": myrole,
        "balance": balance,
        "deposit_amount": depositAmount,
        "limit_amount": limitAmount,
        "mystatus": mystatus,
        "restaurant": restaurant!.toJson(),
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
  });

  int? id;
  String? name;
  int? userId;
  String? description;
  String? deliveryCharge;
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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        description: json["description"],
        deliveryCharge: json["delivery_charge"].toString(),
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
      };
}
