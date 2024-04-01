import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:clean_architecture_provider/features/todo/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodosListView extends StatelessWidget {
  final TodoState todoState;
  final String errorMessage;
  final String successMessage;
  final List<TodoEntity> todos;
  const TodosListView({
    super.key,
    required this.todoState,
    required this.todos,
    required this.errorMessage,
    required this.successMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (todoState == TodoState.error) {
      // Show snackbar when an error occurs
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      );
    }

    if (todoState == TodoState.success) {
      // Show snackbar when success occurs
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                successMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      );
    }

    return todoState == TodoState.fetching
        ? const Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
            ),
          )
        : todos.isEmpty
            ? const Center(
                child: Text("You have nothing to do..."),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoItem(todoEntity: todos[index]);
                },
              );
  }
}
