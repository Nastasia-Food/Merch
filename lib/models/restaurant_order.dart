class RestaurantOrder {
  RestaurantOrder({
    int? status,
    List<Order>? data,
  }) {
    _status = status;
    _data = data;
  }

  RestaurantOrder.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Order.fromJson(v));
      });
    }
  }
  int? _status;
  List<Order>? _data;

  int? get status => _status;
  List<Order>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Order {
  Order({
    int? id,
    int? userId,
    String? orderCode,
    String? total,
    String? subTotal,
    String? deliveryCharge,
    dynamic platform,
    dynamic deviceId,
    dynamic ip,
    int? status,
    String? statusName,
    String? orderTypeName,
    int? orderType,
    int? paymentStatus,
    int? paymentMethod,
    String? paymentMethodName,
    String? paidAmount,
    String? address,
    String? invoiceId,
    dynamic deliverBoyId,
    int? restaurantId,
    int? productReceived,
    String? mobile,
    String? lat,
    String? long,
    String? createdAt,
    String? updatedAt,
    String? timeFormat,
    String? date,
  }) {
    _id = id;
    _userId = userId;
    _total = total;
    _orderCode = orderCode;
    _subTotal = subTotal;
    _deliveryCharge = deliveryCharge;
    _platform = platform;
    _deviceId = deviceId;
    _ip = ip;
    _status = status;
    _statusName = statusName;
    _orderTypeName =  orderTypeName;
    _orderType =  orderType;
    _paymentStatus = paymentStatus;
    _paymentMethod = paymentMethod;
    _paymentMethodName = paymentMethodName;
    _paidAmount = paidAmount;
    _address = address;
    _invoiceId = invoiceId;
    _deliverBoyId = deliverBoyId;
    _restaurantId = restaurantId;
    _productReceived = productReceived;
    _mobile = mobile;
    _lat = lat;
    _long = long;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _timeFormat = timeFormat;
    _date = date;
  }

  Order.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _orderCode = json['order_code'];
    _total = json['total'];
    _subTotal = json['sub_total'];
    _deliveryCharge = json['delivery_charge'];
    _platform = json['platform'];
    _deviceId = json['device_id'];
    _ip = json['ip'];
    _status = json['status'];
    _statusName = json['status_name'];
    _orderType = int.parse(json["order_type"].toString());
    _orderTypeName = json["order_type_name"];
    _paymentStatus = json['payment_status'];
    _paymentMethod = json['payment_method'];
    _paymentMethodName = json['payment_method_name'];
    _paidAmount = json['paid_amount'];
    _address = json['address'];
    _invoiceId = json['invoice_id'];
    _deliverBoyId = json['deliver_boy_id'];
    _restaurantId = json['restaurant_id'];
    _productReceived = json['product_received'];
    _mobile = json['mobile'];
    _lat = json['lat'];
    _long = json['long'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _timeFormat = json['time_format'];
    _date = json['date'];
  }
  int? _id;
  int? _userId;
  String? _orderCode;
  String? _total;
  String? _subTotal;
  String? _deliveryCharge;
  dynamic _platform;
  dynamic _deviceId;
  dynamic _ip;
  int? _status;
  String? _statusName;
  int? _orderType;
  String? _orderTypeName;
  int? _paymentStatus;
  int? _paymentMethod;
  String? _paymentMethodName;
  String? _paidAmount;
  String? _address;
  String? _invoiceId;
  dynamic _deliverBoyId;
  int? _restaurantId;
  int? _productReceived;
  String? _mobile;
  String? _lat;
  String? _long;
  String? _createdAt;
  String? _updatedAt;
  String? _timeFormat;
  String? _date;

  int? get id => _id;
  int? get userId => _userId;
  String? get total => _total;
  String? get orderCode => _orderCode;
  String? get subTotal => _subTotal;
  String? get deliveryCharge => _deliveryCharge;
  dynamic get platform => _platform;
  dynamic get deviceId => _deviceId;
  dynamic get ip => _ip;
  int? get status => _status;
  String? get statusName => _statusName;
  int? get orderType => _orderType;
  String? get orderTypeName => _orderTypeName;
  int? get paymentStatus => _paymentStatus;
  int? get paymentMethod => _paymentMethod;
  String? get paymentMethodName => _paymentMethodName;
  String? get paidAmount => _paidAmount;
  String? get address => _address;
  String? get invoiceId => _invoiceId;
  dynamic get deliverBoyId => _deliverBoyId;
  int? get restaurantId => _restaurantId;
  int? get productReceived => _productReceived;
  String? get mobile => _mobile;
  String? get lat => _lat;
  String? get long => _long;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get timeFormat => _timeFormat;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['order_code'] = _orderCode;
    map['total'] = _total;
    map['sub_total'] = _subTotal;
    map['delivery_charge'] = _deliveryCharge;
    map['platform'] = _platform;
    map['device_id'] = _deviceId;
    map['ip'] = _ip;
    map['status'] = _status;
    map['status_name'] = _statusName;
    map['order_type'] = _orderType;
    map['order_type_name'] = _orderTypeName;
    map['payment_status'] = _paymentStatus;
    map['payment_method'] = _paymentMethod;
    map['payment_method_name'] = _paymentMethodName;
    map['paid_amount'] = _paidAmount;
    map['address'] = _address;
    map['invoice_id'] = _invoiceId;
    map['deliver_boy_id'] = _deliverBoyId;
    map['restaurant_id'] = _restaurantId;
    map['product_received'] = _productReceived;
    map['mobile'] = _mobile;
    map['lat'] = _lat;
    map['long'] = _long;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['time_format'] = _timeFormat;
    map['date'] = _date;
    return map;
  }
}
