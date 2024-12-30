import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:get/get.dart';

class NoOrderFoundOrderHistory extends StatefulWidget {
  final String message;
  final String imgUrl;
  NoOrderFoundOrderHistory(this.message, this.imgUrl, {Key? key})
      : super(key: key);

  @override
  _NoOrderFoundOrderHistoryState createState() =>
      _NoOrderFoundOrderHistoryState();
}

class _NoOrderFoundOrderHistoryState extends State<NoOrderFoundOrderHistory> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30, right: 15),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white10,
                child: Image(
                  image: AssetImage(widget.imgUrl),
                ),
                radius: mainWidth / 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " ${widget.message} " + "FOUND".tr,
                style:
                    TextStyle(fontSize: FontSize.xLarge, color: Colors.black87),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
