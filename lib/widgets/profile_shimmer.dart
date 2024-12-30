import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/profile_controller.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileShimmerState();
  }
}

class _ProfileShimmerState extends State<ProfileShimmer> {
  final profileController = Get.put(Profile_Controller());
  var mainHeight, mainWidth;
  String? phone, name, address;

  @override
  void initState() {
    // GlobalController _globalController=GlobalController();

    profileController.onInit();
    setState(() {
      phone = profileController.phone;
      name = profileController.name;
      address = profileController.address;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    getProfileValue();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeColors.baseThemeColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CustomPaint(
                    painter: HeaderCurvedContainer(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        highlightColor: Colors.grey[400]!,
                        baseColor: Colors.grey[300]!,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: mainWidth / 3,
                          height: mainWidth / 3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Images.shimmerImage),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          highlightColor: Colors.grey[400]!,
                          baseColor: Colors.grey[300]!,
                          child: InkWell(
                            onTap: () => print("Reward Taped"),
                            child: Container(
                              height: mainHeight / 10,
                              width: mainWidth / 2.5,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Shimmer.fromColors(
                                        highlightColor: Colors.grey[400]!,
                                        baseColor: Colors.grey[300]!,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ACTIVE_REWARD'.tr,
                                              style: TextStyle(
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.arrow_circle_up,
                                              color: ThemeColors.baseThemeColor,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '155',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: ThemeColors.baseThemeColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Shimmer.fromColors(
                          highlightColor: Colors.grey[400]!,
                          baseColor: Colors.grey[300]!,
                          child: InkWell(
                            onTap: () => print("Order Taped"),
                            child: Container(
                              height: mainHeight / 10,
                              width: mainWidth / 2.5,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ACTIVE_ORDERS'.tr,
                                          style: TextStyle(
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_circle_up,
                                          color: ThemeColors.baseThemeColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '155',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ThemeColors.baseThemeColor,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child: Container(
                        //margin: EdgeInsets.symmetric(vertical: 20),
                        height: mainHeight / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(.0),
                          image: DecorationImage(
                            image: AssetImage(Images.shimmerImage),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.dstATop),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                highlightColor: Colors.grey[400]!,
                                baseColor: Colors.grey[300]!,
                                child: GestureDetector(
                                  onTap: () {
                                    print('name taped');
                                  },
                                  child: Container(
                                    height: 55,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: ThemeColors.baseThemeColor,
                                        size: 30,
                                      ),
                                      title: Text(
                                        "CUSTOMER",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                highlightColor: Colors.grey[400]!,
                                baseColor: Colors.grey[300]!,
                                child: GestureDetector(
                                  onTap: () {
                                    print('location taped');
                                  },
                                  child: Container(
                                    height: 55,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.location_on_outlined,
                                        color: ThemeColors.baseThemeColor,
                                        size: 26,
                                      ),
                                      title: Text(
                                        "LOCATION".tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                highlightColor: Colors.grey[400]!,
                                baseColor: Colors.grey[300]!,
                                child: GestureDetector(
                                  onTap: () {
                                    print('Phone taped');
                                  },
                                  child: Container(
                                    height: 55,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.phone_sharp,
                                        color: ThemeColors.baseThemeColor,
                                        size: 26,
                                      ),
                                      title: Text(
                                        "PHONE_NO".tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getProfileValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  void getProfile() {}
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ThemeColors.baseThemeColor;
    Path path = Path()
      ..relativeLineTo(0, 115)
      ..quadraticBezierTo(size.width / 2, 250, size.width, 120)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  getProfileValue() async {
    //Return String
    //  String? stringValue = prefs.getString('token');
  }
}
