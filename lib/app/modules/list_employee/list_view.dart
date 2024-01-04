import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_transisi_app/app/routes/app_pages.dart';
import 'package:tes_transisi_app/style/style.dart';

import 'list_controller.dart';

class ListEmployeeView extends GetView<ListEmployeeController> {
  const ListEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white))],
          title: Text(
            'Employee',
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
            if (controller.userList.isNotEmpty) {
              return SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: (controller.userList).length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL, arguments: '${controller.userList[index].id}');
                            print('${controller.userList[index].id}');
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 12),
                            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(backgroundImage: NetworkImage(controller.userList[index].avatar)),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.userList[index].lastName, style: AppTextStyles.titleFieldHeader),
                                    Text(controller.userList[index].email, style: AppTextStyles.titleFieldHeader),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                        bottom: 15,
                        right: 15,
                        child: FloatingActionButton(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            Get.toNamed(Routes.CREATE);
                          },
                          child: Icon(Icons.add),
                        ))
                  ],
                ),
              );
            }
            return Center(
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor)),
                onPressed: () => controller.onInit(),
                child: Text('Refresh', style: AppTextStyles.titleFieldHeader.copyWith(color: Colors.white)),
              ),
            );
          }
        }));
  }
}
