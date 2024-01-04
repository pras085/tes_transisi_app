import 'package:get/get.dart';

import 'detail_employee_controller.dart';

class DetailEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailEmployeeController>(
      () => DetailEmployeeController(),
    );
  }
}
