import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/app/modules/todoData/controllers/todo_data_controller.dart';

import '../models/todoData.dart';

class TodoView extends StatefulWidget {
  final TodoData todoData;
  final Function restartPage;
  const TodoView(
      {super.key, required this.todoData, required this.restartPage});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  bool isChecked = false;
  final todoDataController = Get.put(TodoDataController());

  _deleteItam() {
    todoDataController.todoData.remove(widget.todoData);
    widget.restartPage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _deleteItam,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: isChecked
                  ? Text(widget.todoData.work,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough))
                  : Text(
                      widget.todoData.work,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
