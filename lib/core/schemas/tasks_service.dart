import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_getx/core/schemas/task_model.dart';


class TasksService extends GetxService {
  var tasks = <TaskModel>[].obs;
  final GetStorage storage = GetStorage();
  var competedTaskList = <TaskModel>[].obs;
  var pendingTaskList = <TaskModel>[].obs;

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
      updateLists();
    }
    tasks.refresh();
  } //////////

//save data
  void saveTask() {
    storage.write('tasks', tasks.map((task) => task.toJson()).toList());
  }


  void onChecked(bool? value, int index) {
    if (value != null) {
      print(value);
      tasks[index].isChecked.value = value;
      updateLists();
      saveTask();
    }
  }

  void deleteTask(index) {
    tasks.removeAt(index);
    saveTask();
  } //////

  void updateLists(){
    pendingTaskList.clear();
    competedTaskList.clear();
    pendingTaskList.addAll(tasks.where((element) => element.isChecked == false));
    competedTaskList.addAll(tasks.where((element) => element.isChecked == true));
    tasks.refresh();
  }
}
