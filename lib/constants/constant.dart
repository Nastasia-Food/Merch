import 'package:flutter/material.dart';

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color kBlue = Color(0xff5663ff);

class AppColor {
  static const Color primaryColor = Color(0xff3C85A6);
  static const Color primaryFont = Color(0xff394D5E);
  static const Color darkFont = Color(0xff242627);
  static const Color lightFont = Color(0xff6D6D6D);
  static const Color iconColor = Color(0xff3C85A6);
  static const Color greyFont = Color(0xff7B7B7B);
  static const Color greyColor = Color(0xffB7B7B7);
}

class Gradients {
  static const RadialGradient walletGradient = RadialGradient(
    colors: [Color(0xff89fff4), Color(0xffffffff)],
    center: Alignment.center,
    radius: 3,
  );
  static const RadialGradient homeGradient = RadialGradient(
    colors: [Color(0xff89fff4), Color(0xffffffff)],
    center: Alignment.centerRight,
    radius: 1.8,
  );
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xff6DC0E5), Color(0xff5399B8)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    stops: [0, 0.5],
  );
}
