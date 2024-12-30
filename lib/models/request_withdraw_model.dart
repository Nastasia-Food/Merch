class RequestWithdrawModel {
  RequestWithdrawModel({
    this.status,
    this.data,
  });

  RequestWithdrawModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null
        ? RequestWithdrawData.fromJson(json['data'])
        : null;
  }
  int? status;
  RequestWithdrawData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class RequestWithdrawData {
  RequestWithdrawData({
    this.requestWithdraws,
    this.balance,
  });

  RequestWithdrawData.fromJson(dynamic json) {
    if (json['requestWithdraws'] != null) {
      requestWithdraws = [];
      json['requestWithdraws'].forEach((v) {
        requestWithdraws?.add(RequestWithdraws.fromJson(v));
      });
    }
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : null;
  }
  List<RequestWithdraws>? requestWithdraws;
  Balance? balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (requestWithdraws != null) {
      map['requestWithdraws'] =
          requestWithdraws?.map((v) => v.toJson()).toList();
    }
    if (balance != null) {
      map['balance'] = balance?.toJson();
    }
    return map;
  }
}

class Balance {
  Balance({
    this.totalBalance,
    this.orderBalance,
    this.requestedAmount,
    this.withdrawAmount,
  });

  Balance.fromJson(dynamic json) {
    totalBalance = json['totalBalance'].toString();
    orderBalance = json['orderBalance'].toString();
    requestedAmount = json['requestedAmount'].toString();
    withdrawAmount = json['withdrawAmount'].toString();
  }
  String? totalBalance;
  String? orderBalance;
  String? requestedAmount;
  String? withdrawAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalBalance'] = totalBalance;
    map['orderBalance'] = orderBalance;
    map['requestedAmount'] = requestedAmount;
    map['withdrawAmount'] = withdrawAmount;
    return map;
  }
}

class RequestWithdraws {
  RequestWithdraws({
    this.id,
    this.user,
    this.status,
    this.amount,
    this.dateDB,
    this.statusLabel,
    this.date,
  });

  RequestWithdraws.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'].toString();
    status = json['status'].toString();
    statusLabel = json['status_label'].toString();
    amount = json['amount'].toString();
    date = json['date'].toString();
    dateDB = json['date_db_style'].toString();
  }
  int? id;
  String? user;
  String? status;
  String? amount;
  String? dateDB;
  String? statusLabel;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user'] = user;
    map['status'] = status;
    map['status_label'] = statusLabel;
    map['amount'] = amount;
    map['date'] = date;
    map['date_db_style'] = dateDB;
    return map;
  }
}
