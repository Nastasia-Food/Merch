import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/withdraw_controller.dart';
import '../../models/request_withdraw_model.dart';
import '../../utils/theme_colors.dart';
import '../../utils/validate.dart';

class UpdateRequestWithdrawPage extends StatefulWidget {
  final RequestWithdraws? withdrawList;

  UpdateRequestWithdrawPage({Key? key, this.withdrawList}) : super(key: key);

  @override
  _UpdateRequestWithdrawPage createState() => _UpdateRequestWithdrawPage();
}

class _UpdateRequestWithdrawPage extends State<UpdateRequestWithdrawPage> {
  final WithdrawController withdrawController = Get.put(WithdrawController());

  final TextEditingController amountController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat("yyyy-MM-dd");
  DateTime? date;

  String? dateWithdraw;
  String? amount;

  int? value1;
  int? value2;
  int? value3;
  int? value4;

  @override
  void initState() {
    DateTime tempDate =
        new DateFormat("yyyy-MM-dd").parse(widget.withdrawList!.dateDB!);
    dateWithdraw = tempDate.toString();
    String formattedDate = DateFormat('yyyy-MM-dd').format(tempDate);
    dateCtl.text = formattedDate;
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
          'UPDATE_REQUEST_WITHDRAW'.tr,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: amountWidget(),
                    margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    child: dateWidget(),
                    margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      final form = _formKey.currentState!;
                      if (form.validate()) {
                        withdrawController.updateRequest(
                            widget.withdrawList!.id, amount, dateWithdraw);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ThemeColors.baseThemeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'UPDATE_REQUEST_WITHDRAW'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget amountWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'AMOUNT'.tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
            obscureText: false,
            initialValue: widget.withdrawList!.amount.toString(),
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
            keyboardType: TextInputType.number,
            validator: (value) {
              amount = value!.trim();
              return Validate.requiredField(value, 'AMOUND_IS_REQUIRED'.tr);
            })
      ],
    );
  }

  Widget dateWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'DATE*'.tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 0,
        ),
        TextFormField(
          controller: dateCtl,
          decoration: InputDecoration(
            labelText: 'DATE'.tr,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                dateCtl.text = formattedDate;
                dateWithdraw = formattedDate.toString();
              });
            }
          },
        ),
      ],
    );
  }
}
