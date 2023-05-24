import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/app/modules/todoData/controllers/todo_data_controller.dart';

import '../models/todoData.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key, required this.restartPage});
  final Function restartPage;

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final _task = TextEditingController();
   final todoDataController = Get.put(TodoDataController());

  @override
  void dispose() {
    _task.dispose();
    super.dispose();
  }

  _addItemInList(){
    todoDataController.todoData.add(TodoData(work: _task.text));
    Navigator.pop(context);
    widget.restartPage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "New Task",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _task,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: _addItemInList,
              child: const Text(
                "ADD",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
