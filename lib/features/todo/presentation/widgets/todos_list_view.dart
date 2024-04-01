import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:clean_architecture_provider/features/todo/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoNotifier>(
      builder: (context, todoNotifier, child) {
        TodoState state = todoNotifier.todoState;

        if (state == TodoState.error) {
          // Show snackbar when an error occurs
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    todoNotifier.errorMessage,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }

        if (state == TodoState.success) {
          // Show snackbar when success occurs
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    todoNotifier.successMessage,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }

        return state == TodoState.fetching
            ? const Center(
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                ),
              )
            : todoNotifier.todos.isEmpty
                ? const Center(
                    child: Text("You have nothing to do..."),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: todoNotifier.todos.length,
                    itemBuilder: (context, index) {
                      return TodoItem(todoEntity: todoNotifier.todos[index]);
                    },
                  );
      },
    );
  }
}
