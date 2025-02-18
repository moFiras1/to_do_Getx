import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../schemas/tasks_service.dart';
import 'custom_text-form_field.dart';

void showEditBottomSheet(int index) {

  TextEditingController editTaskControl = TextEditingController();
  TextEditingController editDateControl = TextEditingController();
  final TasksService tasksService = Get.find<TasksService>();
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            label: 'Edit your Task',
            KeyBoardType: TextInputType.text,
            controller: editTaskControl,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: 'Edit Date',
            KeyBoardType: TextInputType.text,
            controller: editDateControl,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  tasksService.editTask(index, editTaskControl.text, editDateControl.text);
                  Get.back();
                },
                child: Text("Save"),
              ),
            ],
          )
        ],
      ),
    ),
    isScrollControlled: true, // ✅ Allows full screen bottom sheet if needed
  );
}
