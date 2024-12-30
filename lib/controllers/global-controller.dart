import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/models/settings_model.dart';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:foodbank_marchantise_app/services/user-service.dart';
import 'package:foodbank_marchantise_app/views/sign_in.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  Server server = Server();
  UserService userService = UserService();
  String? bearerToken;
  bool isUser = false;
  String? supportPhone,
      userId,
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
  String? get currency => currencyCode;

  initController() async {
    final validUser = await userService.loginCheck();
    print(validUser);
    isUser = validUser;
    print('global isUser: $isUser');
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    if (isUser) {
      final token = await userService.getToken();
      final myId = await userService.getUserId();
      bearerToken = token;
      userId = myId;
      Future.delayed(Duration(milliseconds: 10), () {
        update();
      });
      Server.initClass(token: bearerToken);
    }
  }

  @override
  void onInit() {
    initController();
    siteSettings();
    super.onInit();
  }

  userLogout({BuildContext? context}) async {
    getValue();
    await updateFcmUnSubscribe();
    await userService.removeSharedPreferenceData();
    getValue();
    // isUser = false;
    // update();
    Get.off(() => LoginPage());
  }

  updateFcmUnSubscribe() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var deviceToken = storage.getString('deviceToken');
    Map body = {
      "device_token": deviceToken,
      "topic": null,
    };
    String jsonBody = json.encode(body);
    server
        .postRequest(endPoint: APIList.fcmUnSubscribe, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('responseBody===========>');
        print(jsonResponse);
      }
    });
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return stringValue;
  }

  siteSettings() async {
    server.getRequestSettings(APIList.settings).then((response) {
      final jsonResponse = json.decode(response.body);
      print('jsonResponsekkkkk');
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
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
        supportPhone = settingData.data!.supportPhone;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        return Container(child: Center(child: CircularProgressIndicator()));
      }
    });
  }

  updateFCMToken(fcmToken) async {
    Map body = {'device_token': fcmToken};
    String jsonBody = json.encode(body);
    server
        .putRequest(endPoint: APIList.device, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {}
    });
  }
}
