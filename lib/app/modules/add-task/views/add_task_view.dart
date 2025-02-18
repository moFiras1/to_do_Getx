import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_getx/app/modules/home/controllers/home_controller.dart';

import '../../../../core/shered_component/custom_text-form_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
   AddTaskView({super.key});
   AddTaskController controller =Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add a task',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 19),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'cancel',
                  style: TextStyle(fontSize: 12, color: Color(0xff757575)),
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                label: 'name your task',
                KeyBoardType: TextInputType.text,
                controller: taskController,
              ),
              CustomTextFormField(
                label: 'Date',
                KeyBoardType: TextInputType.datetime,
                controller: dateController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Date cannot be empty"; // ✅ Prevent empty input
                  }

                  // ✅ Ensure only numbers and '/' are used
                  RegExp allowedChars = RegExp(r"^[0-9/]+$");
                  if (!allowedChars.hasMatch(p0)) {
                    return "Only numbers and '/' are allowed";
                  }

                  // ✅ Regular Expression to match DD/MM/YYYY format (basic validation)
                  RegExp dateRegex = RegExp(
                      r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$");

                  if (!dateRegex.hasMatch(p0)) {
                    return "Enter a valid date (DD/MM/YYYY)";
                  }

                  // ✅ Additional logical check for valid days in months
                  List<String> parts = p0.split('/');
                  int day = int.parse(parts[0]);
                  int month = int.parse(parts[1]);
                  int year = int.parse(parts[2]);

                  // February special case (leap year check)
                  if (month == 2) {
                    bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
                    if (day > (isLeapYear ? 29 : 28)) {
                      return "Invalid day for February";
                    }
                  }

                  // Months with only 30 days
                  List<int> monthsWith30Days = [4, 6, 9, 11];
                  if (monthsWith30Days.contains(month) && day > 30) {
                    return "Invalid day for this month";
                  }

                  return null; // ✅ No errors
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.addTask(
                        taskController.text, dateController.text);
                    Get.back();
                  },
                  child: Text('Save'))
            ],
          ),
        ));
  }
}
