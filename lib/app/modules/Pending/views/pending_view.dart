import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/Bottom-nav-bar.dart';
import '../../../../core/schemas/task_model.dart';
import '../../../../core/schemas/tasks_service.dart';
import '../../../../core/shered_component/circular_button.dart';
import '../../../../core/shered_component/task_text.dart';
import '../controllers/pending_controller.dart';

class PendingView extends GetView<PendingController> {
  PendingView({super.key});

  final TasksService tasksService = Get.find<TasksService>();

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
                      'Pending',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                CircularButton(
                  bgColor: Color(0xffFF6F61),
                  myIcon: Icons.timer_sharp,
                  iconColor: Colors.white,
                  size: 24,
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        final List<TaskModel> pendingTasks =
            tasksService.tasks.where((task) => task.isChecked.value == false ).toList();

        if (pendingTasks.isEmpty) {
          return Center(child: Text("No pending tasks"));
        }

        return ListView.builder(
          itemCount: pendingTasks.length,
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
