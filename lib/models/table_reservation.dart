// To parse this JSON data, do
//
//     final restaurantOrder = restaurantOrderFromJson(jsonString);

import 'dart:convert';

TableReservation restaurantOrderFromJson(String str) => TableReservation.fromJson(json.decode(str));

String restaurantOrderToJson(TableReservation data) => json.encode(data.toJson());

class TableReservation {
  TableReservation({
    this.data,
  });

  Data? data;

  factory TableReservation.fromJson(Map<String, dynamic> json) => TableReservation(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.status,
    this.data,
  });

  int? status;
  List<ReservationDatum>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    data: List<ReservationDatum>.from(json["data"].map((x) => ReservationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ReservationDatum {
  ReservationDatum({
    this.id,
    this.restaurant,
    this.name,
    this.email,
    this.phone,
    this.reservationDate,
    this.slot,
    this.table,
    this.guest,
    this.status,
    this.status_name,
  });

  int? id;
  String? restaurant;
  String? name;
  String? email;
  String? phone;
  String? reservationDate;
  String? slot;
  String? status_name;
  String? table;
  int? status;
  int? guest;


  factory ReservationDatum.fromJson(Map<String, dynamic> json) => ReservationDatum(
    id: json["id"],
    // restaurant: json["restaurant"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    reservationDate: json["reservation_date"],
    slot: json["slot"],
    table: json["table"],
    guest: json["guest"],
    status: json["status"],
    status_name: json["status_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "reservation_date": reservationDate,
    "slot": slot,
    "table": table,
    "guest": guest,
    "status": status,
    "status_name": status_name,
  };
}
