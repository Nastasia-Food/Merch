import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodbank_marchantise_app/widgets/authentication.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'controllers/global-controller.dart';
import 'controllers/settings-controller.dart';
import 'translation/language.dart';

final box = GetStorage();
dynamic langValue = const Locale('en', null);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(SettingsController()).onInit();

  if (box.read('languageCode') != null) {
    langValue = Locale(box.read('languageCode'), null);
  } else {
    langValue = const Locale('en', null);
  }

  runApp(FoodEx());
}

class FoodEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Get.put(GlobalController()).onInit();
    return OverlaySupport(
      child: GetMaterialApp(
        locale: langValue,
        translations: Languages(),
        debugShowCheckedModeBanner: false,
        title: 'FoodBank',
        theme: ThemeData(useMaterial3: false),
        home: Authentication(),
      ),
    );
  }
}
