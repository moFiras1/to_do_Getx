import 'package:get/get.dart';

import '../modules/Completed/bindings/completed_binding.dart';
import '../modules/Completed/views/completed_view.dart';
import '../modules/Pending/bindings/pending_binding.dart';
import '../modules/Pending/views/pending_view.dart';
import '../modules/add-task/bindings/add_task_binding.dart';
import '../modules/add-task/views/add_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PENDING,
      page: () => const PendingView(),
      binding: PendingBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED,
      page: () =>  CompletedView(),
      binding: CompletedBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () =>  AddTaskView(),
      binding: AddTaskBinding(),
    ),
  ];
}
