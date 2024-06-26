import 'package:clean_architecture_provider/features/todo/data/models/todo_model.dart';

/// Data source responsible for managing local storage of Todo items.
class LocalTodoDataSource {
  final List<TodoModel> data = [
    TodoModel(
      id: "00a1",
      description: "Go shopping",
      isCompleted: true,
    ),
  ];

  /// Fetches all todos asynchronously.
  Future<List<TodoModel>> getTodos() async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 1));
      // Return a copy of the data list to prevent direct manipulation
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to fetch todos: $e');
    }
  }

  /// Adds a todo asynchronously.
  Future<List<TodoModel>> addTodo(TodoModel todoModel) async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 1));
      // Add the todo to the data list
      data.add(todoModel);
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to add todo: $e');
    }
  }

  /// Deletes a todo by its ID asynchronously.
  Future<List<TodoModel>> deleteTodo(String id) async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 1));
      // Find the todo with the given ID
      final index = data.indexWhere((element) => element.id == id);
      // Throw an exception if the todo is not found
      if (index == -1) {
        throw Exception('Todo with ID $id not found');
      }
      // Remove the todo from the data list
      data.removeAt(index);
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to delete todo: $e');
    }
  }

  /// Updates a todo asynchronously.
  Future<List<TodoModel>> updateTodo(TodoModel todoModel) async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 1));
      // Find the index of the todo to be updated
      final index = data.indexWhere((element) => element.id == todoModel.id);
      // Throw an exception if the todo is not found
      if (index == -1) {
        throw Exception('Todo with ID ${todoModel.id} not found');
      }
      // Update the todo at the found index
      data[index] = todoModel;
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to update todo: $e');
    }
  }
}
