import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_getx/core/schemas/task_model.dart';

class TasksService extends GetxService{
var tasks= <TaskModel>[].obs;
final GetStorage storage = GetStorage();

void editTask(int index, String newText, String newDate) {
  tasks[index].text = newText;
  tasks[index].time = newDate;
  saveTask();
  tasks.refresh();
}

// load data
  void loadTasks() {
    List<dynamic>? storedTasks = storage.read('tasks');
    if (storedTasks != null) {
      tasks.clear();
      tasks.addAll(storedTasks.map((e) => TaskModel.fromJson(e)).toList());
    }
    Future.microtask(() => tasks.refresh());

  }//////////

//save data
  void saveTask() {
    storage.write('tasks', tasks.map((task) => task.toJson()).toList());
  }
completedTask(){

}
  void onChecked(bool? value, int index) {
    if (value != null) {
      Future.microtask(() {
        tasks[index].isChecked.value = value;
        saveTask();
      });
    }
  }

void deleteTask(index) {
  tasks.removeAt(index);
  saveTask();
}//////


}