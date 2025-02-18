import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/schemas/task_model.dart';
import '../../../../core/schemas/tasks_service.dart';
import '../../../../core/shered_component/circular_button.dart';
import '../../../../core/shered_component/task_text.dart';
import '../controllers/completed_controller.dart';

class CompletedView extends GetView<CompletedController> {
   CompletedView({super.key});
   final TasksService tasksService = Get.find<TasksService>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
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
                      'Completed',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                CircularButton(
                  bgColor: Color(0xff008080),
                  myIcon: Icons.check,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
      body:Obx(() {
        final List<TaskModel> completedTasks =  tasksService.tasks
            .where((task) => task.isChecked.value)
            .toList();

        if (completedTasks.isEmpty) {
          return Center(child: Text("No completed tasks"));
        }

        return ListView.builder(
          itemCount: completedTasks.length,
          itemBuilder: (context, index) {
            return TaskText(
              index: index,
            );
          },
        );
      }),


    );
  }
}
