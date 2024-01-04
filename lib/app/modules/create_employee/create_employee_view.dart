import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_transisi_app/style/style.dart';

import 'create_employee_controller.dart';

class CreateEmployeeView extends GetView<CreateEmployeeController> {
  const CreateEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close, color: Colors.white)),
          leadingWidth: 48,
          titleSpacing: 12,
          actions: [
            TextButton(
              onPressed: () {
                controller.postCreateSubmit();
              },
              child: Text(
                'Save',
                style: AppTextStyles.titleFieldHeader.copyWith(color: Colors.white),
              ),
            )
          ],
          title: Text(
            'Create Employee',
            style: AppTextStyles.titleFieldHeader.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Container(
                // color: Colors.greenAccent,
                padding: EdgeInsets.all(16),
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.pickFile();
                      },
                      child: controller.fileAvatar.value == null
                          ? CircleAvatar(
                              minRadius: 54,
                              foregroundColor: Colors.red,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(Icons.camera_alt, color: Colors.white),
                            )
                          : CircleAvatar(
                              minRadius: 54,
                              foregroundColor: Colors.red,
                              backgroundColor: AppColors.primaryColor,
                              backgroundImage: FileImage(controller.fileAvatar.value!),
                            ),
                    ),
                    AppTextField(title: 'Front Name', controller: controller.nameFrontC),
                    AppTextField(title: 'Back Name', controller: controller.nameBackC),
                    AppTextField(title: 'Work', controller: controller.workC),
                    AppTextField(title: 'Telephone', controller: controller.numberPhoneC, isForNumber: true),
                    AppTextField(title: 'Email', controller: controller.emailC),
                    AppTextField(title: 'Website', controller: controller.websiteC),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
