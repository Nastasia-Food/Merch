class TransactionsModel {
  TransactionsModel({
    this.status,
    this.data,
  });

  TransactionsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TransactionsData.fromJson(v));
      });
    }
  }
  int? status;
  List<TransactionsData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TransactionsData {
  TransactionsData({
    this.id,
    this.type,
    this.fromUser,
    this.toUser,
    this.amount,
    this.status,
    this.date,
  });

  TransactionsData.fromJson(dynamic json) {
    id = json['id'];
    type = int.parse(json['type'].toString());
    fromUser = json['from_user'].toString();
    toUser = json['to_user'].toString();
    amount = json['amount'].toString();
    status = json['status'].toString();
    date = json['date'].toString();
  }
  int? id;
  int? type;
  String? fromUser;
  String? toUser;
  String? amount;
  String? status;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['from_user'] = fromUser;
    map['to_user'] = toUser;
    map['amount'] = amount;
    map['status'] = status;
    map['date'] = date;
    return map;
  }
}
