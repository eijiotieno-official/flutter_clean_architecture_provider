import 'package:clean_architecture_provider/features/todo/data/datasources/todo_datasource.dart';
import 'package:clean_architecture_provider/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_provider/features/todo/domain/usecases/add_todo_use_case.dart';
import 'package:clean_architecture_provider/features/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:clean_architecture_provider/features/todo/domain/usecases/get_todos_use_case.dart';
import 'package:clean_architecture_provider/features/todo/domain/usecases/update_todo_use_case.dart';
import 'package:flutter/material.dart';

// Enum to represent different states of the TodoNotifier
enum TodoState {
  idle, // Initial state
  adding,
  fetching, // Fetching todos
  loading, // Loading state (optional)
  success, // Success state
  error, // Error state
  updating, // Updating todo (optional)
  deleting, // Deleting todo (optional)
}

// Notifier class to manage Todo state
class TodoNotifier extends ChangeNotifier {
  late TodoRepository _todoRepository;

  TodoState _todoState = TodoState.idle;
  String _errorMessage = '';
  String _successMessage = '';
  List<TodoEntity> _todos = [];

  // Getters for current state and error message
  TodoState get todoState => _todoState;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  List<TodoEntity> get todos => _todos;

  // Constructor with dependency injection of TodoRepository
  TodoNotifier() {
    _todoRepository = TodoRepositoryImpl(TodoDataSource());
  }

  // Private method to update the state and notify listeners
  void _setState(
    TodoState newState, {
    String errorMessage = '',
    String successMessage = '',
  }) {
    _todoState = newState;
    _errorMessage = errorMessage;
    _successMessage = successMessage;
    notifyListeners();
    Future.delayed(const Duration(seconds: 5), () {
      _todoState = TodoState.idle;
      notifyListeners();
    });
  }

  // Method to fetch todos
  Future<void> getTodos() async {
    _setState(TodoState.fetching); // Set state to fetching
    try {
      // Call GetTodosUseCase to fetch todos from repository
      _todos = await GetTodosUseCase(_todoRepository).call();
      _setState(
          TodoState.success); // Set state to success if fetch is successful
    } catch (e) {
      _setState(TodoState.error,
          errorMessage: e.toString()); // Set state to error if fetch fails
    }
  }

  // Method to fetch todos
  Future<void> addTodo(TodoEntity todoEntity) async {
    _setState(TodoState.adding);
    try {
      // Call GetTodosUseCase to fetch todos from repository
      _todos = await AddTodoUseCase(_todoRepository).call(todoEntity);

      _setState(TodoState.success,
          successMessage:
              "Successfully added"); // Set state to success if fetch is successful
    } catch (e) {
      _setState(TodoState.error,
          errorMessage: e.toString()); // Set state to error if fetch fails
    }
  }

  // Method to fetch todos
  Future<void> deleteTodo(String id) async {
    _setState(TodoState.deleting); // Set state to fetching
    try {
      // Call GetTodosUseCase to fetch todos from repository
      _todos = await DeleteTodoUseCase(_todoRepository).call(id);
      _setState(TodoState.success,
          successMessage:
              "Successfully deleted"); // Set state to success if fetch is successful
    } catch (e) {
      _setState(TodoState.error,
          errorMessage: e.toString()); // Set state to error if fetch fails
    }
  }

  // Method to fetch todos
  Future<void> updateTodo(TodoEntity todoEntity) async {
    _setState(TodoState.updating); // Set state to fetching
    try {
      // Call GetTodosUseCase to fetch todos from repository
      _todos = await UpdateTodoUseCase(_todoRepository).call(todoEntity);
      _setState(TodoState.success,
          successMessage:
              "Successfully updated"); // Set state to success if fetch is successful
    } catch (e) {
      _setState(TodoState.error,
          errorMessage: e.toString()); // Set state to error if fetch fails
    }
  }
}
