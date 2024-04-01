import 'package:flutter/material.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todoEntity;

  // Constructor to initialize TodoEntity
  const TodoItem({super.key, required this.todoEntity});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).hoverColor,
          ),
        ),
      ),
      child: ListTile(
        // Delete button to delete the todo item
        leading: IconButton(
          onPressed: () => _deleteTodo(context),
          icon: const Icon(
            Icons.delete_rounded,
          ),
        ),
        // Todo item description with strike-through if completed
        title: Text(
          todoEntity.description,
          style: TextStyle(
            decoration: todoEntity.isCompleted == true
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        // Checkbox to mark the todo item as completed or incomplete
        trailing: Checkbox(
          value: todoEntity.isCompleted,
          onChanged: (value) => _updateTodo(context),
        ),
      ),
    );
  }

  // Function to delete a todo item
  void _deleteTodo(BuildContext context) {
    context.read<TodoNotifier>().deleteTodo(todoEntity.id);
  }

  // Function to update the completion status of a todo item
  void _updateTodo(BuildContext context) {
    context.read<TodoNotifier>().updateTodo(
          todoEntity.copyWith(
            isCompleted: !todoEntity.isCompleted,
          ),
        );
  }
}
