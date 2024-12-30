import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../controllers/transaction_controller.dart';
import '../../utils/images.dart';
import '../../utils/theme_colors.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPage createState() => _TransactionsPage();
}

class _TransactionsPage extends State<TransactionsPage> {
  final TransactionsController transactionsController =
      Get.put(TransactionsController());

  bool active = true;
  bool colorData = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColors.baseThemeColor,
          foregroundColor: Colors.white,
          title: Text(
            'TRANSACTIONS'.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<TransactionsController>(
            init: TransactionsController(),
            builder: (creditData) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.19,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: creditData.transactions.length,
                        itemBuilder: (context, index) {
                          String data =
                              creditData.transactions[index].amount.toString();
                          colorData = true;
                          if (data[0].toString() == '-') {
                            colorData = false;
                          }
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
                                                  .transactions[index].fromUser
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: AppColor.darkFont,
                                              ),
                                            ),
                                            Text(
                                              'TO'.tr,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                            Text(
                                              creditData
                                                  .transactions[index].toUser
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
                                                  .transactions[index].date
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
                                          creditData.transactions[index].amount
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: colorData == true
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
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
