import 'package:get/get.dart';
import 'package:tes_transisi_app/app/modules/detail_employee/detail_employee_binding.dart';
import 'package:tes_transisi_app/app/modules/detail_employee/detail_employee_view.dart';
import 'package:tes_transisi_app/app/modules/list_employee/list_binding.dart';
import 'package:tes_transisi_app/app/modules/list_employee/list_view.dart';

import '../modules/create_employee/create_employee_binding.dart';
import '../modules/create_employee/create_employee_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.LIST,
      page: () => ListEmployeeView(),
      binding: ListEmployeeBinding(),
    ),
    GetPage(
      name: Routes.CREATE,
      page: () => CreateEmployeeView(),
      binding: CreateEmployeeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailEmployeeView(),
      binding: DetailEmployeeBinding(),
    ),
  ];
}
