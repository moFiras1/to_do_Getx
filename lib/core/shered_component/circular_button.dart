import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/app/routes/app_pages.dart';

class CircularButton extends GetView {
   IconData myIcon;
   Color bgColor;
   Color iconColor;
   double size;
   CircularButton({super.key,required this.myIcon,required this.bgColor,required this.iconColor , this.size =42});

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
       Get.toNamed(Routes.ADD_TASK);
     },
      child: Container(

        decoration: BoxDecoration(shape: BoxShape.circle,color:bgColor, ),height: 42,width: 42,
        child: Icon(myIcon,color: iconColor,size: size,),
      ),
    );
  }
}
