import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_getx/core/shered_component/show_bottom_sheet.dart';

import '../schemas/tasks_service.dart';


class TaskText extends GetView<HomeController> {
  final int index;
  final TasksService tasksService = Get.find<TasksService>();
  TaskText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Obx(
                () =>
                Checkbox(
                  value: tasksService.tasks[index].isChecked.value,
                  onChanged: (bool? value) {
                    tasksService.onChecked(value, index);
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
                tasksService.tasks[index].text,
                style:controller.lineThrough(index),
              ),
            ),
            Text(
              tasksService.tasks[index].time,
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
