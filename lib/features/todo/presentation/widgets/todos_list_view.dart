import 'package:flutter/material.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:clean_architecture_provider/features/todo/presentation/widgets/todo_item.dart';

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
    // Show snackbar based on todoState
    _showSnackBar(context);

    // Display appropriate content based on todoState
    return _buildContent(context);
  }

  void _showSnackBar(BuildContext context) {
    // Show snackbar when there's an error or success
    if (todoState == TodoState.error) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    } else if (todoState == TodoState.success) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                successMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildContent(BuildContext context) {
    // Show loading indicator while fetching todos
    if (todoState == TodoState.fetching) {
      return const Center(
        child: CircularProgressIndicator(strokeCap: StrokeCap.round),
      );
    }

    // Show message if there are no todos
    if (todos.isEmpty) {
      return const Center(
        child: Text("You have nothing to do..."),
      );
    }

    // Display list of todos
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(todoEntity: todos[index]);
      },
    );
  }
}
