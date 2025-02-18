import 'package:get/get.dart';

import '../../../../core/schemas/tasks_service.dart';

class AllController extends GetxController {
  final TasksService tasksService = Get.find<TasksService>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tasksService.loadTasks();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
