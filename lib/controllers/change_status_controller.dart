import 'dart:convert';
import 'package:foodbank_marchantise_app/services/api-list.dart';
import 'package:foodbank_marchantise_app/services/server.dart';
import 'package:get/get.dart';

class Category_Controller extends GetxController {
  Server server = Server();
  //List<CategoryDataModel> categoriesList = <CategoryDataModel>[];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeStatus(status, id) async {
    print(">>>>>>>>>>>>>>>>login tapped");
    var jsonMap = {
      'status': status,
    };
    String jsonStr = jsonEncode(jsonMap);
    server
        .putRequest(
            endPoint: APIList.notificationOrderUpdateById! + id + '/update',
            body: jsonStr)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        Get.rawSnackbar(message: 'Please enter valid input');
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
