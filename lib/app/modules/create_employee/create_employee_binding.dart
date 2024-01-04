import 'package:get/get.dart';

import 'create_employee_controller.dart';

class CreateEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEmployeeController>(
      () => CreateEmployeeController(),
    );
  }
}
