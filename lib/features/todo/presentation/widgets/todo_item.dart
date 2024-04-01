import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todoEntity;
  
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
        leading: IconButton(
          onPressed: () =>
              context.read<TodoNotifier>().deleteTodo(todoEntity.id),
          icon: const Icon(
            Icons.delete_rounded,
          ),
        ),
        title: Text(
          todoEntity.description,
          style: TextStyle(
            decoration: todoEntity.isCompleted == true
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        trailing: Checkbox(
          value: todoEntity.isCompleted,
          onChanged: (value) => context.read<TodoNotifier>().updateTodo(
                todoEntity.copyWith(
                    isCompleted: todoEntity.isCompleted == true ? false : true),
              ),
        ),
      ),
    );
  }
}
