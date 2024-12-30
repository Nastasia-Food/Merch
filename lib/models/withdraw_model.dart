class WithdrawModel {
  WithdrawModel({
    this.status,
    this.data,
  });

  WithdrawModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WithdrawData.fromJson(v));
      });
    }
  }
  int? status;
  List<WithdrawData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WithdrawData {
  WithdrawData({
    this.id,
    this.user,
    this.paymentType,
    this.amount,
    this.date,
  });

  WithdrawData.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'].toString();
    paymentType = json['payment_type'].toString();
    amount = json['amount'].toString();
    date = json['date'].toString();
  }
  int? id;
  String? user;
  String? paymentType;
  String? amount;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user'] = user;
    map['payment_type'] = paymentType;
    map['amount'] = amount;
    map['date'] = date;
    return map;
  }
}
