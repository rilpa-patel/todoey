import 'package:get/get.dart';

import '../controllers/todo_data_controller.dart';

class TodoDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoDataController>(
      () => TodoDataController(),
    );
  }
}
