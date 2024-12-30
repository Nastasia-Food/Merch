import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/global-controller.dart';
import 'package:foodbank_marchantise_app/controllers/notification_order_controller.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/widgets/order_list_pending.dart';
import 'package:foodbank_marchantise_app/widgets/shimmer/home_page_shimmer.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'no_order_order_history.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  //int status=1;
  final order_Controller = Get.put(OrderListController());
  final settingController = Get.put(GlobalController());

  @override
  void initState() {
    order_Controller.onInit();

    if (mounted) {
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {});
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        order_Controller.onInit();
        if (message.data.isNotEmpty) {
          showOverlayNotification((context) {
            return Card(
              semanticContainer: true,
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: SafeArea(
                child: ListTile(
                  leading: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'assets/images/icon.png',
                          height: 35,
                          width: 35,
                        )),
                  ),
                  title: Text(message.data['title'].toString()),
                  subtitle: Text(message.data['body'].toString()),
                  trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        OverlaySupportEntry.of(context)!.dismiss();
                      }),
                ),
              ),
            );
          });
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    }
    update();
    super.initState();
  }

  update() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var deviceToken = storage.getString('deviceToken');
    settingController.updateFCMToken(deviceToken);
  }

  Future<Null> _refresh() async {
    print('refreshing stocks...');
    order_Controller.onInit();
    await Future.delayed(new Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return GetBuilder<OrderListController>(
      init: OrderListController(),
      builder: (orders) => orders.loader
          ? HomePageShimmer()
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ThemeColors.baseThemeColor,
                foregroundColor: Colors.white,
                centerTitle: true,
                title: settingController.siteName == null
                    ? Text("WELCOME".tr)
                    : Text(
                        '${settingController.siteName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
              ),
              body: RefreshIndicator(
                onRefresh: _refresh,
                child: orders.orderList.length > 0
                    ? Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Orders()],
                      )
                    : NoOrderFoundOrderHistory(
                        "NO_ORDER".tr, Images.noOrderFound),
              )),
    );
  }
}
