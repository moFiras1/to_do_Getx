import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/schemas/tasks_service.dart';

class HomeController extends GetxController {
  final TasksService tasksService = Get.find<TasksService>();

  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }




}
