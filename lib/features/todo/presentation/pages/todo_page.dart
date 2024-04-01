import 'dart:math';

import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:clean_architecture_provider/features/todo/presentation/widgets/todos_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoNotifier>(
      builder: (context, todoNotifier, child) {
        TodoState todoState = todoNotifier.todoState;
        List<TodoEntity> todos = todoNotifier.todos;
        String successMessage = todoNotifier.successMessage;
        String errorMessage = todoNotifier.errorMessage;
        return Scaffold(
          appBar: AppBar(
            title: todoState == TodoState.adding
                ? const Text("Adding ... ")
                : todoState == TodoState.fetching
                    ? const Text("Fetching ... ")
                    : todoState == TodoState.deleting
                        ? const Text("Deleting ... ")
                        : todoState == TodoState.updating
                            ? const Text("Updating ... ")
                            : const Text("Clean Architecture Provider"),
            centerTitle: true,
          ),
          body: TodosListView(
            todoState: todoState,
            todos: todos,
            errorMessage: errorMessage,
            successMessage: successMessage,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('New Todo'),
                    content: TextField(
                      autofocus: true,
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "What's on your mind?",
                      ),
                      onChanged: (value) => setState(() {}),
                    ),
                    actionsPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Random random = Random();
                          String id = (random.nextInt(100000) + 1).toString();

                          context.read<TodoNotifier>().addTodo(
                                TodoEntity(
                                  id: id,
                                  description: _textEditingController.text,
                                  isCompleted: false,
                                ),
                              );

                          _textEditingController.clear();

                          Navigator.of(context).pop();
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.create_rounded),
            label: const Text("Compose"),
          ),
        );
      },
    );
  }
}
