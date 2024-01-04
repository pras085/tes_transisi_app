import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_transisi_app/style/style.dart';

import 'detail_employee_controller.dart';

class DetailEmployeeView extends GetView<DetailEmployeeController> {
  const DetailEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          leadingWidth: 48,
          titleSpacing: 12,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.star_border_outlined, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit, color: Colors.white),
            ),
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        body: Obx(() {
          if (controller.isLoading.value || controller.userModel == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.4,
                    width: Get.width,
                    color: AppColors.primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if ((controller.userModel?.avatar ?? '').isNotEmpty)
                          Container(
                            height: Get.height * 0.20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(controller.userModel?.avatar ?? ''),
                              ),
                            ),
                          )
                        else
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 104,
                          ),
                        Text(
                          '${controller.userModel?.firstName}  ${controller.userModel?.lastName}',
                          style: AppTextStyles.titleHeader.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  _listContent(value: 'ID', title: controller.userModel?.id.toString() ?? '', leading: Icons.call, trailing: Icons.message),
                  _listContent(value: 'Email', title: controller.userModel?.email ?? '', leading: Icons.email),
                  _listContent(value: 'Share', title: controller.userModel?.firstName ?? '', leading: Icons.share),
                ],
              ),
            );
          }
        }));
  }

  Widget _listContent({IconData? trailing, IconData? leading, String? title, String? value}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      width: Get.width,
      child: Material(
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 40,
            trailing: IconButton(onPressed: () {}, icon: Icon(trailing), color: Colors.grey),
            leading: IconButton(onPressed: () {}, icon: Icon(leading), color: AppColors.primaryColor),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? '', style: AppTextStyles.titleFieldHeader.copyWith(fontSize: 14)),
                Text(value ?? '', style: AppTextStyles.titleFieldHeader),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
