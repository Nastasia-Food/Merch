// To parse this JSON data, do
//
//     final setting = settingFromJson(jsonString);

import 'dart:convert';

Setting settingFromJson(String str) => Setting.fromJson(json.decode(str));

String settingToJson(Setting data) => json.encode(data.toJson());

class Setting {
  Setting({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
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
    this.siteEmail,
    this.siteName,
    this.sitePhoneNumber,
    this.siteDescription,
    this.stripeKey,
    this.stripeSecret,
    this.googleMapApiKey,
    this.currencyName,
    this.supportPhone,
    this.currencyCode,
    this.siteLogo,
    this.customerAppName,
    this.customerAppLogo,
    this.customerSplashScreenLogo,
    this.vendorAppName,
    this.vendorAppLogo,
    this.vendorSplashScreenLogo,
    this.deliveryAppName,
    this.deliveryAppLogo,
    this.deliverySplashScreenLogo,
  });

  String? siteEmail;
  String? siteName;
  String? sitePhoneNumber;
  String? siteDescription;
  String? stripeKey;
  String? stripeSecret;
  String? googleMapApiKey;
  String? currencyName;
  String? supportPhone;
  String? currencyCode;
  String? siteLogo;
  String? customerAppName;
  String? customerAppLogo;
  String? customerSplashScreenLogo;
  String? vendorAppName;
  String? vendorAppLogo;
  String? vendorSplashScreenLogo;
  String? deliveryAppName;
  String? deliveryAppLogo;
  String? deliverySplashScreenLogo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    siteEmail: json["site_email"],
    siteName: json["site_name"],
    sitePhoneNumber: json["site_phone_number"],
    siteDescription: json["site_description"],
    stripeKey: json["stripe_key"],
    stripeSecret: json["stripe_secret"],
    googleMapApiKey: json["google_map_api_key"],
    currencyName: json["currency_name"],
    supportPhone: json["support_phone"],
    currencyCode: json["currency_code"],
    siteLogo: json["site_logo"],
    customerAppName: json["customer_app_name"],
    customerAppLogo: json["customer_app_logo"],
    customerSplashScreenLogo: json["customer_splash_screen_logo"],
    vendorAppName: json["vendor_app_name"],
    vendorAppLogo: json["vendor_app_logo"],
    vendorSplashScreenLogo: json["vendor_splash_screen_logo"],
    deliveryAppName: json["delivery_app_name"],
    deliveryAppLogo: json["delivery_app_logo"],
    deliverySplashScreenLogo: json["delivery_splash_screen_logo"],
  );

  Map<String, dynamic> toJson() => {
    "site_email": siteEmail,
    "site_name": siteName,
    "site_phone_number": sitePhoneNumber,
    "site_description": siteDescription,
    "stripe_key": stripeKey,
    "stripe_secret": stripeSecret,
    "google_map_api_key": googleMapApiKey,
    "currency_name": currencyName,
    "support_phone": supportPhone,
    "currency_code": currencyCode,
    "site_logo": siteLogo,
    "customer_app_name": customerAppName,
    "customer_app_logo": customerAppLogo,
    "customer_splash_screen_logo": customerSplashScreenLogo,
    "vendor_app_name": vendorAppName,
    "vendor_app_logo": vendorAppLogo,
    "vendor_splash_screen_logo": vendorSplashScreenLogo,
    "delivery_app_name": deliveryAppName,
    "delivery_app_logo": deliveryAppLogo,
    "delivery_splash_screen_logo": deliverySplashScreenLogo,
  };
}
