import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class Validators {
  String? validateEmail({String? value}) {
    if (value!.length == 0)
      return "PLEASE_ENTER_YOUR_EMAIL".tr;
    else if (!EmailValidator.validate(value))
      return "PLEASE_ENTER_VALID_EMAIL".tr;
    else
      return null;
  }

  String? validatePassword({String? value}) {
    if (value!.isEmpty) {
      return 'PASSWORD_IS_REQUIRED'.tr;
    } else if (value.length < 6) {
      return 'PASSWORD_MUST_BE_AT_LEAST_6_CHARACTERS'.tr;
    }
    return null;
  }

  String? validateName({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_YOUR_NAME'.tr;
    }
    return null;
  }

  String? validateUsername({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_YOUR_USERNAME'.tr;
    }
    return null;
  }

  String? validateVehicleID({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_YOUR_VEHICLEID'.tr;
    }
    return null;
  }

  String? phoneVehicleID({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_YOUR_PHONE'.tr;
    }
    return null;
  }

  String? validateAccidentName({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_ACCIDENT_NAME'.tr;
    }
    return null;
  }

  String? validateAccidentDescription({String? value}) {
    if (value!.isEmpty) {
      return 'PLEASE_WRITE_SMONE_NOTES'.tr;
    }
    return null;
  }
}
