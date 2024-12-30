import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/models/profile.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/images.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyRestaurant extends StatelessWidget {
  final Restaurant? restaurant;

  MyRestaurant(this.restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainHeight;
    var mainWidth;

    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY_RESTAURANT".tr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: restaurant!.image.toString(),
              imageBuilder: (context, imageProvider) => Container(
                padding: EdgeInsets.only(bottom: 15),
                height: mainHeight / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.0),
                      topRight: Radius.circular(2.0)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  padding: EdgeInsets.only(bottom: 15),
                  height: mainHeight / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0)),
                    image: DecorationImage(
                      image: AssetImage(Images.shimmerImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            //description container

            Container(
              //height: 300,
              width: mainWidth,
              child: Column(
                children: [
                  ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: restaurant!.logo.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        height: 120,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[400]!,
                        child: Container(
                          height: 120,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(Images.shimmerImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(
                      "${restaurant!.name}",
                      style: TextStyle(
                          fontSize: FontSize.xxLarge,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.orange,
                          size: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Text(
                              "${restaurant!.address}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 15, top: 5),
                    child: Row(
                      children: [
                        Text(
                          "${restaurant!.status}",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text(
                            "NOW".tr,
                            style: TextStyle(
                              color: Colors.grey,
                              //fontSize: FontSize.xLarge,
                              //fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                    child: Row(
                      children: [
                        Text(
                          'OPEN'.tr,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${restaurant!.openingTime}-${restaurant!.closingTime}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${restaurant!.description}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
