import 'package:get/get.dart';

import 'package:tes_transisi_app/app/modules/home/home_binding.dart';
import 'package:tes_transisi_app/app/modules/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
