import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/Bottom-nav-bar.dart';
import '../../../../core/shered_component/circular_button.dart';
import '../../../../core/shered_component/task_text.dart';
import '../controllers/pending_controller.dart';

class PendingView extends GetView<PendingController> {
  const PendingView({super.key});
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
                      'Pending',
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
                  bgColor:Color(0xffFF6F61),
                  myIcon: Icons.timer_sharp,
                  iconColor: Colors.white,
                  size: 24,
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(children: [
        SizedBox(height: 103,),

      ]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
