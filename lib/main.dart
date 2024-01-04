import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "TransisiTesApp",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Poppins',
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    ),
  );
}
