import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/auth-controller.dart';
import 'package:foodbank_marchantise_app/services/user-service.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/views/sign_in.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  UserService userService = UserService();

  AuthController _authController = AuthController();
  var mainHeight, mainWidth;
  late bool isInternet;

  @override
  void initState() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    FirebaseMessaging.instance.getToken().then((token) {
      update(token!);
    });
    Timer(
      Duration(seconds: 5),
      () {
        logInCheck();
      },
    );
    super.initState();
  }

  update(String token) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('deviceToken', token);
    print(token);
  }

  void logInCheck() async {
    var isUser = await userService.getBool();
    if (isUser == true) {
      await _authController.refreshToken();
    } else {
      Get.off(() => LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: mainHeight,
        width: mainWidth,
        color: ThemeColors.baseThemeColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  Images.appLogo,
                  height: 230,
                  width: 230,
                ),
              ),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
