import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/schemas/tasks_service.dart';
import '../../Completed/views/completed_view.dart';
import '../../Pending/views/pending_view.dart';
import '../../all/views/all_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TasksService tasksService = Get.find<TasksService>();
  int selectedIndex = 0;

  void onTap(index) {
    selectedIndex = index;
    setState(() {});
  }

  List<Widget> widgetList = [AllView(),  PendingView(),CompletedView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'All',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.pending),
                label: 'Pending',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: 'Completed',
                backgroundColor: Colors.grey),
          ],
        ));
  }
}
