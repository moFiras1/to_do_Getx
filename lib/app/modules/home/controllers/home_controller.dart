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




  lineThrough(index) {
    return tasksService.tasks[index].isChecked.value == false
        ? TextStyle(color: Colors.black, fontSize: 20)
        : TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 20,
            color: Colors.green);
  }
}
