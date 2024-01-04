import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tes_transisi_app/network/network_helper.dart';
import 'package:tes_transisi_app/style/style.dart';

class CreateEmployeeController extends GetxController {
  var nameFrontC = TextEditingController();
  var nameBackC = TextEditingController();
  var workC = TextEditingController();
  var numberPhoneC = TextEditingController();
  var emailC = TextEditingController();
  var websiteC = TextEditingController();

  final DioClient client = DioClient();
  var isLoading = false.obs;

  var fileAvatar = Rxn<File>();


  @override
  void onClose() {}

  Future postCreateSubmit() async {
    isLoading(true);
    if (nameFrontC.text.trim().isEmpty || nameBackC.text.trim().isEmpty || workC.text.trim().isEmpty || numberPhoneC.text.trim().isEmpty || emailC.text.trim().isEmpty || websiteC.text.trim().isEmpty) {
      isLoading(false);
      AppAlert(message: 'Must be filled !', alertType: AlertType.error);
      return;
    }
    var res = await client.createUser(
      name: "${nameFrontC.text} ${nameBackC.text}",
      job: workC.text,
      avatar: fileAvatar.value?.path ?? '',
      email: emailC.text,
      phoneNumber: numberPhoneC.text,
      website: websiteC.text,
    );
    if (res != null) {
      AppAlert(message: 'Create user ${res['name']} is Success', alertType: AlertType.success);
    } else {
      AppAlert(message: 'Erorr Api ..', alertType: AlertType.error);
    }
    isLoading(false);
  }

  Future<void> pickFile() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (pickedFile != null) {
        // Use the picked file (e.g., display it, upload it, etc.)
        fileAvatar.value = File(pickedFile.path);
        print("Image path: ${pickedFile.path}");
      } else {
        // User canceled the picker
        AppAlert(message: 'Image picking canceled.', alertType: AlertType.warning);
      }
    } catch (e) {
      print(e.toString());
      AppAlert(message: 'Error picking image: $e', alertType: AlertType.error);
    }
  }
}
