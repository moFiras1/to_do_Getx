import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/app/modules/home/controllers/home_controller.dart';
import '../app/routes/app_pages.dart';

class BottomNavBar extends GetView<HomeController> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    List<String> labels = ["All", "Pending", "Completed"];
    List<String> routes = [Routes.HOME, Routes.PENDING, Routes.COMPLETED];
    return Container(
        height: 51,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              labels.length,
              (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (Get.currentRoute != routes[index]) {
                        controller.selectNewIndex(index);
                        Get.offAllNamed(routes[index]);
                      }
                    },
                      child: Obx(
                      () {
                        bool isSelected =
                            controller.selectedIndex.value == index;
                        return AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(labels[index],
                                style: TextStyle(
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )));
  }
}
