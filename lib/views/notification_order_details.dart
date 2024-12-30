import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColors.scaffoldBgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ORDER_DETAILS'.tr,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
