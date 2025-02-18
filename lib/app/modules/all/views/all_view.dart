import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/schemas/tasks_service.dart';
import '../../../../core/shered_component/circular_button.dart';
import '../../../../core/shered_component/task_text.dart';
import '../controllers/all_controller.dart';

class AllView extends GetView<AllController> {
  final TasksService tasksService = Get.find<TasksService>();

   AllView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(144),
          child: Padding(
            padding: EdgeInsets.only(
              top: 84,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  CircularButton(
                    bgColor: Theme.of(context).primaryColor,
                    myIcon: Icons.add,
                    iconColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),

        body: Obx(() => ListView.builder(
        itemCount: tasksService.tasks.length,
        itemBuilder: (context, index) {
          return TaskText(
            index: index,
          );
        },
      )),
    );
  }
}
