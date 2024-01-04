import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tes_transisi_app/style/style.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/employee_bg.svg', width: Get.height / 2),
          Text('Login Page', style: AppTextStyles.titleHeader.copyWith(color: AppColors.primaryColor)),
          AppTextField(title: 'Username', controller: controller.usernameC),
          AppTextField(title: 'Password', controller: controller.passwordC),
          _divider(),
          _buttonSubmit(),
        ],
      ),
    );
  }

  Widget _buttonSubmit() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {
          // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text('data')));

          controller.login();
        },
        style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(Get.width, 15)),
          backgroundColor: MaterialStatePropertyAll(AppColors.bgFieldColor),
        ),
        child: Text('Login'),
      ),
    );
  }

  Widget _divider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(color: AppColors.primaryColor.withOpacity(0.3)),
            Positioned(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('or', style: AppTextStyles.titleFieldHeader.copyWith(color: AppColors.primaryColor.withOpacity(0.3))),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: Get.width / 2.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconSocialMedia(Icons.mail),
              _iconSocialMedia(Icons.facebook),
              _iconSocialMedia(Icons.apple),
            ],
          ),
        )
      ],
    );
  }

  Widget _iconSocialMedia(IconData icon) {
    return IconButton.outlined(
      onPressed: () {},
      style: ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: AppColors.primaryColor.withOpacity(0.3)))),
      color: AppColors.secondaryColor,
      icon: Icon(icon, color: AppColors.primaryColor.withOpacity(0.8)),
    );
  }
}
