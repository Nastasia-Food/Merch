import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/views/withdraw/request_withdraw_update_page.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../controllers/global-controller.dart';
import '../../controllers/withdraw_controller.dart';
import '../../utils/images.dart';
import '../../utils/theme_colors.dart';
import 'request_withdraw_page.dart';

// ignore: must_be_immutable
class WithdrawPage extends StatelessWidget {
  WithdrawPage({Key? key}) : super(key: key);
  final WithdrawController withdrawController = Get.put(WithdrawController());
  bool active = true;
  bool colorData = true;
  @override
  Widget build(BuildContext context) {
    withdrawController.onInit();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('WITHDRAW'.tr),
        ),
        body: GetBuilder<WithdrawController>(
            init: WithdrawController(),
            builder: (creditData) {
              return Column(
                children: [
                  Container(
                    height: 225,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.creditBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: creditData.withdraws.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 60, bottom: 36),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //wallet section
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              Get.find<GlobalController>()
                                                      .currency! +
                                                  creditData.totalBalance
                                                      .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                            Text(
                                              'CREDIT_BALANCE'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              Get.find<GlobalController>()
                                                      .currency! +
                                                  creditData.withdrawAmount
                                                      .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                            Text(
                                              'WITHDRAW_BALANCE'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              Get.find<GlobalController>()
                                                      .currency! +
                                                  creditData.requestedAmount
                                                      .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                            Text(
                                              'REQUEST_BALANCE'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColor.primaryFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //Button
                                Container(
                                  height: 42,
                                  decoration: BoxDecoration(
                                    gradient: Gradients.buttonGradient,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor:
                                          ThemeColors.baseThemeColor,
                                    ),
                                    onPressed: () {
                                      Get.to(() => AddRequestWithdrawPage());
                                    },
                                    child: Text(
                                      'ADD_REQUEST_WITHDRAW'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),

                  /////
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffE9F8FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            active = true;
                            (context as Element).markNeedsBuild();
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: active == true
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            child: Center(
                                child: Text(
                              'WITHDRAW'.tr,
                              style: TextStyle(
                                color: active == true
                                    ? AppColor.primaryColor
                                    : AppColor.greyFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            active = false;
                            (context as Element).markNeedsBuild();
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: active == true
                                  ? Colors.transparent
                                  : Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              'REQUEST_BALANCE'.tr,
                              style: TextStyle(
                                color: active == true
                                    ? AppColor.greyFont
                                    : AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  active == true
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: creditData.withdraws.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage(Images.money),
                                                      color:
                                                          AppColor.primaryColor,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(width: 7),
                                                    Text(
                                                      creditData
                                                          .withdraws[index]
                                                          .paymentType
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            AppColor.darkFont,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 14),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'TIME'.tr,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        color:
                                                            AppColor.darkFont,
                                                      ),
                                                    ),
                                                    Text(
                                                      creditData
                                                          .withdraws[index].date
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            AppColor.greyFont,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          Get.find<GlobalController>()
                                                  .currency! +
                                              creditData.withdraws[index].amount
                                                  .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xff23B632),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    child: Divider(
                                        height: .5,
                                        thickness: .5,
                                        color: Color(0xffD9D9D9)),
                                  ),
                                ],
                              );
                            },
                          ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: creditData.requestWithdraws.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                ImageIcon(
                                                  AssetImage(Images.money),
                                                  color: AppColor.primaryColor,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 7),
                                                Text(
                                                  creditData
                                                      .requestWithdraws[index]
                                                      .statusLabel
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: AppColor.darkFont,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 14),
                                            Row(
                                              children: [
                                                Text(
                                                  'TIME'.tr,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: AppColor.darkFont,
                                                  ),
                                                ),
                                                Text(
                                                  creditData
                                                      .requestWithdraws[index]
                                                      .date
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: AppColor.greyFont,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              Get.find<GlobalController>()
                                                      .currency! +
                                                  creditData
                                                      .requestWithdraws[index]
                                                      .amount
                                                      .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: colorData == true
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            creditData.requestWithdraws[index]
                                                        .status ==
                                                    '5'
                                                ? IconButton(
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                    onPressed: () {
                                                      Get.to(
                                                          UpdateRequestWithdrawPage(
                                                        withdrawList: creditData
                                                                .requestWithdraws[
                                                            index],
                                                      ));
                                                      //action coe when button is pressed
                                                    },
                                                    icon: Icon(Icons.edit),
                                                    tooltip: 'EDIT'.tr,
                                                  )
                                                : Container()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    child: Divider(
                                        height: .5,
                                        thickness: .5,
                                        color: Color(0xffD9D9D9)),
                                  ),
                                ],
                              );
                            },
                          ))
                ],
              );
            }));
  }
}
