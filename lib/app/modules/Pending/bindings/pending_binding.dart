import 'package:get/get.dart';

import '../controllers/pending_controller.dart';

class PendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendingController>(
      () => PendingController(),
    );
  }
}
