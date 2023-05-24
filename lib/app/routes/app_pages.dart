import 'package:get/get.dart';

import '../modules/todoData/bindings/todo_data_binding.dart';
import '../modules/todoData/views/todo_data_view.dart';
import '../modules/todoData/bindings/todo_data_binding.dart';
import '../modules/todoData/views/todo_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TODO_DATA;

  static final routes = [
    
    GetPage(
      name: _Paths.TODO_DATA,
      page: () => const TodoPage(),
      binding: TodoDataBinding(),
    ),
  ];
}
