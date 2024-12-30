import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

class Order_details_bottom_bar extends StatefulWidget {
  final Function show_customer_info;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  Order_details_bottom_bar(
      {Key? key,
      required this.show_customer_info,
      this.subTotal,
      this.deliveryFee,
      this.total})
      : super(key: key);

  @override
  _Order_details_bottom_barState createState() =>
      _Order_details_bottom_barState();
}

class _Order_details_bottom_barState extends State<Order_details_bottom_bar> {
  String button_text = "recieved";
  bool recieved_pressed = false;
  var mainHeight, mainWidth;
  var cart_value = 2;
  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;
    mainHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
            color: ThemeColors.off_white_Color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        height: mainHeight / 4.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      'Sub Total',
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      '\$145',
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),

            //SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      'Delivery Fee',
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      '\$84',
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      "Total",
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Text(
                      '\$240',
                      style: TextStyle(fontSize: 16, color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1,
                ),
                width: mainWidth,
                height: 50,
                child: action_button())
          ],
        ));
  }

  action_button() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          //  elevation: 0.0,
          backgroundColor: Colors.black, // background
          foregroundColor: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // <-- Radius
          ),
        ),
        onPressed: () async {
          setState(() {
            showAlertDialog(context);

            recieved_pressed = !recieved_pressed;

            if (recieved_pressed == true) {
              button_text = "Delivered";

              widget.show_customer_info();
            } else {
              button_text = "recieved";
            }
          });
        },
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Text(
            button_text,
            style: TextStyle(
              color: Colors.transparent,
            ),
          ),
        ),
      )
    ]);
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Recieved?"),
      content: Text("Are you sure you have recieved the all products?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //getTrackingSteps list

  List<Step> getTrackingSteps(BuildContext context, statusName, status) {
    List<Step> _orderStatusSteps = [];
    if (status == '10') {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'Order Cancel',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
            )),
        isActive: int.tryParse(status)! >= int.tryParse('10')!,
      ));
    } else {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'Order Pending',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        isActive: int.tryParse(status)! >= int.tryParse('5')!,
      ));
    }
    if (status == '12') {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'Order Reject',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
            )),
        isActive: int.tryParse(status)! >= int.tryParse('12')!,
      ));
    } else {
      _orderStatusSteps.add(Step(
        state: StepState.complete,
        title: Text(
          'Order Accept',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SizedBox(
            width: double.infinity,
            child: Text(
              '',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        isActive: int.tryParse(status)! >= int.tryParse('14')!,
      ));
    }
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'Order Process ',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('15')!,
    ));
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'On The Way',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('17')!,
    ));
    _orderStatusSteps.add(Step(
      state: StepState.complete,
      title: Text(
        'Order Completed',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
          width: double.infinity,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          )),
      isActive: int.tryParse(status)! >= int.tryParse('20')!,
    ));
    return _orderStatusSteps;
  }
}
