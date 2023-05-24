import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/app/modules/todoData/controllers/todo_data_controller.dart';
import './dataview_view.dart';
import './add_data_view.dart';


class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}



class _TodoPageState extends State<TodoPage> {

   late final todoDataController;    // OK
   bool _loading = false;

  @override
  void initState() {
    todoDataController =  Get.put(TodoDataController()); 
    super.initState();

  }
    

  _restartPage() {
    setState(() {});
  }

  _openAddData() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddDataPage(restartPage: _restartPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    int totaltask = 0;
    return 
    GetX<TodoDataController>(
              builder: (controller) {
                return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.fromLTRB(20, screenheight / 15, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Ink(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.menu,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: screenheight / 35),
                  const Text(
                    "Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenheight / 95),
                  Text(
                    "${controller.todoData.length} Tasks",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: screenheight / 1.5,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child:  ListView.builder(
                    itemCount: controller.todoData.length,
                    itemBuilder: ((context, index) => TodoView(
                          restartPage: _restartPage,
                          todoData: controller.todoData[index],
                        )))
              
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddData,
        child: const Icon(Icons.add),
      ),
    );
              }
    );
  }
}
