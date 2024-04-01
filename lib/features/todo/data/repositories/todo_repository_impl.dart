import 'package:clean_architecture_provider/features/todo/data/datasources/todo_datasource.dart';
import 'package:clean_architecture_provider/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  // Fetch all todos from the data source
  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      // Retrieve todos from data source
      final List<TodoModel> result = await _todoDataSource.getTodos();
      // Convert data source models to domain entities and return them
      return result.map((e) => _mapModelToEntity(e)).toList();
    } catch (e) {
      // Throw an error if fetching todos fails
      throw Exception('Failed to fetch todos: $e');
    }
  }

  // Add a new todo to the data source
  @override
  Future<List<TodoEntity>> addTodo(TodoEntity todoEntity) async {
    try {
      // Convert domain entity to data source model
      final TodoModel todoModel = _mapEntityToModel(todoEntity);
      // Add the todo to the data source
      final List<TodoModel> result = await _todoDataSource.addTodo(todoModel);
      // Convert updated models back to entities and return them
      return result.map((e) => _mapModelToEntity(e)).toList();
    } catch (e) {
      // Throw an error if adding todo fails
      throw Exception('Failed to add todo: $e');
    }
  }

  // Delete a todo from the data source by its ID
  @override
  Future<List<TodoEntity>> deleteTodo(String id) async {
    try {
      // Delete the todo from the data source
      final List<TodoModel> result = await _todoDataSource.deleteTodo(id);
      // Convert updated models back to entities and return them
      return result.map((e) => _mapModelToEntity(e)).toList();
    } catch (e) {
      // Throw an error if deleting todo fails
      throw Exception('Failed to delete todo: $e');
    }
  }

  // Update a todo in the data source
  @override
  Future<List<TodoEntity>> updateTodo(TodoEntity todoEntity) async {
    try {
      // Convert domain entity to data source model
      final TodoModel todoModel = _mapEntityToModel(todoEntity);
      // Update the todo in the data source
      final List<TodoModel> result =
          await _todoDataSource.updateTodo(todoModel);
      // Convert updated models back to entities and return them
      return result.map((e) => _mapModelToEntity(e)).toList();
    } catch (e) {
      // Throw an error if updating todo fails
      throw Exception('Failed to update todo: $e');
    }
  }

  // Helper method to map TodoModel to TodoEntity
  TodoEntity _mapModelToEntity(TodoModel model) {
    return TodoEntity(
      id: model.id,
      description: model.description,
      isCompleted: model.isCompleted,
    );
  }

  // Helper method to map TodoEntity to TodoModel
  TodoModel _mapEntityToModel(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      description: entity.description,
      isCompleted: entity.isCompleted,
    );
  }
}
