import 'package:clean_architecture_provider/features/todo/data/models/todo_model.dart';

class TodoDataSource {
  final List<TodoModel> data = [
    TodoModel(
      id: "00a1",
      description: "Go shopping",
      isCompleted: true,
    ),
  ];

  // Method to fetch all todos asynchronously
  Future<List<TodoModel>> getTodos() async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 5));
      // Return a copy of the data list to prevent direct manipulation
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to fetch todos: $e');
    }
  }

  // Method to add a todo asynchronously
  Future<List<TodoModel>> addTodo(TodoModel todoModel) async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 3));
      // Add the todo to the data list
      data.add(todoModel);
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to add todo: $e');
    }
  }

  // Method to delete a todo by its ID asynchronously
  Future<List<TodoModel>> deleteTodo(String id) async {
    try {
      // Simulate delay using Future.delayed
      await Future.delayed(const Duration(seconds: 3));
      // Find the todo with the given ID
      bool todoToRemove = data.any((element) => element.id == id);
      // Throw an exception if the todo is not found
      if (todoToRemove == false) {
        throw Exception('Todo with ID $id not found');
      }
      // Remove the todo from the data list
      data.removeWhere((element) => element.id == id);
      return List<TodoModel>.from(data);
    } catch (e) {
      // Throw an exception with a relevant error message
      throw Exception('Failed to delete todo: $e');
    }
  }

  // Method to update a todo asynchronously
  Future<List<TodoModel>> updateTodo(TodoModel todoModel) async {
    try {
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
