import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/models/settings_model.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:get/get.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:foodbank_marchantise_app/services/user-service.dart';

class SettingsController extends GetxController {
  Server server = Server();
  UserService userService = UserService();
  String? bearerToken;
  bool isUser = false;
  String? userId,
      stripeKey,
      stripeSecret,
      googleMapApiKey,
      currencyCode,
      currencyName,
      siteName,
      siteEmail,
      siteLogo,
      vendorAppName,
      vendorAppLogo;

  initController() async {
    siteSettings();
  }

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  siteSettings() async {
    server.getRequestSettings(APIList.settings).then((response) {
      final jsonResponse = json.decode(response.body);
      print('jsonResponsekkkkk');
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // var settingData = SettingData.fromJson(jsonResponse);
        var settingData = Setting.fromJson(jsonResponse);
        stripeKey = settingData.data!.stripeKey;
        stripeSecret = settingData.data!.stripeSecret;
        googleMapApiKey = settingData.data!.googleMapApiKey;
        currencyCode = settingData.data!.currencyCode;
        currencyName = settingData.data!.currencyName;
        siteName = settingData.data!.siteName;
        siteEmail = settingData.data!.siteEmail;
        siteLogo = settingData.data!.siteLogo;
        vendorAppName = settingData.data!.vendorAppName;
        vendorAppLogo = settingData.data!.vendorAppLogo;

        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        return Container(child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
