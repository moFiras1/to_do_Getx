import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_getx/core/app_theme/app_theme.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';
import 'core/schemas/tasks_service.dart';

void main() async {
  await GetStorage.init();
  Get.put(TasksService());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: MyThemeData.lightTheme,
      initialBinding: HomeBinding(),

    ),
  );
}
