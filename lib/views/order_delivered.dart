import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:get/get.dart';

class Delivery_completed extends StatefulWidget {
  const Delivery_completed({Key? key}) : super(key: key);

  @override
  _Delivery_completedState createState() => _Delivery_completedState();
}

class _Delivery_completedState extends State<Delivery_completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Foodex",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: FontSize.xLarge,
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Image(
                image: AssetImage(
                  "assets/images/delivery___completed.png",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "DELIVERY_COMPLETED".tr,
              style: TextStyle(
                  // fontWeight: FontWeight.w300,
                  fontSize: FontSize.xLarge,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
