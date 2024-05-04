import 'package:clean_architecture_provider/features/todo/data/datasources/local_todo_datasource.dart';
import 'package:clean_architecture_provider/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalTodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    // Fetch todos from the data source
    final List<TodoModel> result = await _todoDataSource.getTodos();
    // Map data source models to domain entities and return them
    return result.map((e) => _mapModelToEntity(e)).toList();
  }

  @override
  Future<List<TodoEntity>> addTodo(TodoEntity todoEntity) async {
    // Map domain entity to data source model
    final TodoModel todoModel = _mapEntityToModel(todoEntity);
    // Add todo to the data source
    final List<TodoModel> result = await _todoDataSource.addTodo(todoModel);
    // Map updated models back to domain entities and return them
    return result.map((e) => _mapModelToEntity(e)).toList();
  }

  @override
  Future<List<TodoEntity>> deleteTodo(String id) async {
    // Delete todo from the data source
    final List<TodoModel> result = await _todoDataSource.deleteTodo(id);
    // Map updated models back to domain entities and return them
    return result.map((e) => _mapModelToEntity(e)).toList();
  }

  @override
  Future<List<TodoEntity>> updateTodo(TodoEntity todoEntity) async {
    // Map domain entity to data source model
    final TodoModel todoModel = _mapEntityToModel(todoEntity);
    // Update todo in the data source
    final List<TodoModel> result = await _todoDataSource.updateTodo(todoModel);
    // Map updated models back to domain entities and return them
    return result.map((e) => _mapModelToEntity(e)).toList();
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
