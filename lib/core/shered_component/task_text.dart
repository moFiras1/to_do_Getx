import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_getx/core/shered_component/show_bottom_sheet.dart';

import '../schemas/task_model.dart';
import '../schemas/tasks_service.dart';


class TaskText extends GetView<HomeController> {
  final int index;
  final RxList<TaskModel> tasks;
  final TasksService tasksService = Get.find<TasksService>();
  TaskText({super.key, required this.index, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Obx(
                () =>
                Checkbox(
                  value: tasks[index].isChecked.value,
                  onChanged: (bool? value) {
                    tasks[index].isChecked.value = value!;
                    tasksService.updateLists();
                    tasksService.saveTask();///////////////////////////////////////////////////////
                    // tasksService.onChecked(value, index);
                  },
                  activeColor: Color(0xff008080),
                ),
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () =>  Text(
                tasks[index].text,
                style: TextStyle(
                    decoration: tasks[index].isChecked.value ? TextDecoration.lineThrough : null,
                    fontSize: 20,
                    color: tasks[index].isChecked.value ?  Colors.green : Colors.black,
                ),////////////////////////////
              ),
            ),
            Text(
              tasks[index].time,
              style: TextStyle(
                  color: Color(0xffA3A3A3).withOpacity(1), fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              showEditBottomSheet(index);
            },
            icon: Icon(
              Icons.edit_note_outlined,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {
              tasksService.deleteTask(index);
            },
            icon: Icon(
              Icons.delete_outlined,
              color: Colors.red,
            )),
      ],
    );
    ;
  }

}
