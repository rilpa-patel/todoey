import 'package:get/get.dart';
import 'package:todoey/app/modules/todoData/models/todoData.dart';

class TodoDataController extends GetxController {
  //TODO: Implement TodoDataController

  var todoData = <TodoData>[].obs;
  @override
  void onInit() async{
    super.onInit();
    await fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    var data = [TodoData(work: "complete task"), TodoData(work: "interview")];

    todoData.value = data;
  }
}
