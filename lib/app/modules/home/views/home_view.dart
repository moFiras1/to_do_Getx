import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_getx/core/shered_component/task_text.dart';

import '../../../../core/Bottom-nav-bar.dart';
import '../../../../core/schemas/tasks_service.dart';
import '../../../../core/shered_component/circular_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
                      'Task',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'October 15',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    )
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
            task: tasksService.tasks[index],
            index: index,
          );
        },
      )),
      bottomNavigationBar:BottomNavBar(),
    );
  }
}
