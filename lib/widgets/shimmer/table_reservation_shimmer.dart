import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:shimmer/shimmer.dart';

class TableReservationShimmer extends StatefulWidget {
  const TableReservationShimmer({Key? key}) : super(key: key);

  @override
  _TableReservationShimmerState createState() => _TableReservationShimmerState();
}

class _TableReservationShimmerState extends State<TableReservationShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: ExpansionTile(
                title: Container(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 2),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[400]!,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          width: mainWidth / 6,
                          height: mainHeight / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            image: DecorationImage(
                              image: AssetImage(
                                  Images.shimmerImage
                              ),
                              fit: BoxFit.fill,
                              //alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              "Table1",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Text(
                              "Process",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
