import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodbank_marchantise_app/controllers/auth-controller.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/views/order_history.dart';
import 'package:foodbank_marchantise_app/views/profile.dart';
import 'package:foodbank_marchantise_app/views/transaction/transaction_page.dart';
import 'package:get/get.dart';
import 'package:pandabar/pandabar.dart';

import 'home_page.dart';
import 'reservations.dart';

/// This is the main application widget.
class MainScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainScreen> {
  final auth = Get.put(AuthController());

  String page = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.white,
        buttonColor: Colors.blueGrey,
        buttonSelectedColor: ThemeColors.baseThemeColor,
        fabIcon: InkWell(
            onTap: () {
              Get.to(TransactionsPage());
            },
            child: Icon(
              FontAwesomeIcons.creditCard,
              color: Colors.white,
            )),
        fabColors: [ThemeColors.baseThemeColor, ThemeColors.baseThemeColor],
        buttonData: [
          PandaBarButtonData(
              id: 'Home',
              icon: Icons.dashboard_outlined,
              title: 'DASHBOARD'.tr),
          PandaBarButtonData(
              id: 'Reservations',
              icon: Icons.event_note,
              title: 'RESERVATIONS'.tr),
          PandaBarButtonData(
              id: 'Orders_History', icon: Icons.history, title: 'ORDERS'.tr),
          PandaBarButtonData(
              id: 'Profile', icon: Icons.person, title: 'PROFILE'.tr),
        ],
        onFabButtonPressed: () {
          setState(() {
            // Get.to(() => MainScreen());
          });
        },
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
      ),
      body: Builder(
        builder: (context) {
          print(page);
          switch (page) {
            case 'Home':
              return Home_Page();
            case 'Reservations':
              return Reservations();
            case 'Orders_History':
              return Orderhistory();
            case 'Profile':
              return ProfilePage();
            default:
              return Home_Page();
          }
        },
      ),
    );
  }
}
