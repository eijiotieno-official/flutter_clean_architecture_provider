import 'dart:math'; // Importing the dart:math library for generating random IDs

import 'package:flutter/material.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:clean_architecture_provider/features/todo/presentation/widgets/todos_list_view.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textEditingController =
      TextEditingController(); // Text editing controller for the todo input field

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoNotifier>(
      builder: (context, todoNotifier, child) {
        TodoState todoState =
            todoNotifier.todoState; // Current state of the todos
        List<TodoEntity> todos = todoNotifier.todos; // List of todos
        String successMessage =
            todoNotifier.successMessage; // Success message from the notifier
        String errorMessage =
            todoNotifier.errorMessage; // Error message from the notifier

        // Building the UI scaffold
        return Scaffold(
          appBar: AppBar(
            title: _buildAppBarTitle(
                todoState), // Title of the app bar based on the current state
            centerTitle: true,
          ),
          body: TodosListView(
            todoState: todoState,
            todos: todos,
            errorMessage: errorMessage,
            successMessage: successMessage,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _showAddTodoDialog(
                context, todoNotifier), // Show dialog to add a new todo
            icon: const Icon(Icons.create_rounded),
            label: const Text("Compose"),
          ),
        );
      },
    );
  }

  // Function to build the app bar title based on the current state
  Widget _buildAppBarTitle(TodoState todoState) {
    // Setting different titles based on the todoState
    if (todoState == TodoState.adding) {
      return const Text("Adding ... ");
    } else if (todoState == TodoState.fetching) {
      return const Text("Fetching ... ");
    } else if (todoState == TodoState.deleting) {
      return const Text("Deleting ... ");
    } else if (todoState == TodoState.updating) {
      return const Text("Updating ... ");
    } else {
      return const Text("Clean Architecture Provider");
    }
  }

  // Function to show a dialog for adding a new todo
  void _showAddTodoDialog(BuildContext context, TodoNotifier todoNotifier) {
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
              onPressed: () => _confirmAddTodo(
                  context, todoNotifier), // Confirm adding the todo
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Function to confirm adding the todo
  void _confirmAddTodo(BuildContext context, TodoNotifier todoNotifier) {
    Random random = Random();
    String id = (random.nextInt(100000) + 1)
        .toString(); // Generate a random ID for the new todo

    todoNotifier.addTodo(
      TodoEntity(
        id: id,
        description: _textEditingController.text,
        isCompleted: false,
      ),
    );

    _textEditingController.clear(); // Clear the text input field
    Navigator.of(context).pop(); // Close the dialog
  }
}
