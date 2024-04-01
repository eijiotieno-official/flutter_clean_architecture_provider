import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';

// Abstract class defining the contract for TodoRepository
abstract class TodoRepository {
  // Method to fetch all todos asynchronously
  Future<List<TodoEntity>> getTodos();

  // Method to add a todo asynchronously
  Future<List<TodoEntity>> addTodo(TodoEntity todoEntity);

  // Method to update a todo asynchronously
  Future<List<TodoEntity>> updateTodo(TodoEntity todoEntity);

  // Method to delete a todo by its ID asynchronously
  Future<List<TodoEntity>> deleteTodo(String id);
}
