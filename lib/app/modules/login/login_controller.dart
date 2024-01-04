import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_transisi_app/app/routes/app_pages.dart';
import 'package:tes_transisi_app/style/style.dart';

class LoginController extends GetxController {
  var usernameC = TextEditingController();
  var passwordC = TextEditingController();

  @override
  void onClose() {}

  login() {
    if (usernameC.text.trim().isEmpty) {
      return AppAlert(message: 'Username must be filled !', alertType: AlertType.error);
    }
    if (passwordC.text.trim().isEmpty) {
      return AppAlert(message: 'Password must be filled !', alertType: AlertType.error);
    }
    if (usernameC.text.trim() != 'admin' || passwordC.text.trim() != '123') {
      return AppAlert(message: 'Username or password is not correct!', alertType: AlertType.error);
    }
    Get.toNamed(Routes.LIST);
  }
}
