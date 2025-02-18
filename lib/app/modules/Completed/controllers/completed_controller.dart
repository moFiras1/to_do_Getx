import 'package:get/get.dart';

import '../../../../core/schemas/task_model.dart';

class CompletedController extends GetxController {

  var completedContent = <TaskModel>[].obs;

  getCompletedList() {
  }

  @override
  void onInit() {
    getCompletedList();
    refresh();
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
}
