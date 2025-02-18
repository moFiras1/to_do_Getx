import 'package:get/get.dart';

import '../../../../core/schemas/task_model.dart';
import '../../../../core/schemas/tasks_service.dart';

class AddTaskController extends GetxController {

  final TasksService tasksService = Get.find<TasksService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void addTask(String task, String date) {
    tasksService.tasks.add(TaskModel(
      id: tasksService.tasks.length + 1,
      text: task,
      isChecked: false,
      time: date,

    )

    );
    tasksService.saveTask();
  }



}
