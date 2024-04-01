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
    final List<TodoModel> result = await _todoDataSource.getTodos();
    // Convert data source models to domain entities and return them
    return result
        .map((e) => TodoEntity(
              id: e.id,
              description: e.description,
              isCompleted: e.isCompleted,
            ))
        .toList();
  }

  // Add a new todo to the data source
  @override
  Future<List<TodoEntity>> addTodo(TodoEntity todoEntity) async {
    // Convert domain entity to data source model
    final TodoModel todoModel = TodoModel(
      id: todoEntity.id,
      description: todoEntity.description,
      isCompleted: todoEntity.isCompleted,
    );
    // Add the todo to the data source
    final List<TodoModel> result = await _todoDataSource.addTodo(todoModel);
    return result
        .map((e) => TodoEntity(
              id: e.id,
              description: e.description,
              isCompleted: e.isCompleted,
            ))
        .toList();
  }

  // Delete a todo from the data source by its ID
  @override
  Future<List<TodoEntity>> deleteTodo(String id) async {
    // Delete the todo from the data source
    final List<TodoModel> result = await _todoDataSource.deleteTodo(id);
    return result
        .map((e) => TodoEntity(
              id: e.id,
              description: e.description,
              isCompleted: e.isCompleted,
            ))
        .toList();
  }

  // Update a todo in the data source
  @override
  Future<List<TodoEntity>> updateTodo(TodoEntity todoEntity) async {
    // Convert domain entity to data source model
    final TodoModel todoModel = TodoModel(
      id: todoEntity.id,
      description: todoEntity.description,
      isCompleted: todoEntity.isCompleted,
    );
    // Update the todo in the data source
    final List<TodoModel> result = await _todoDataSource.updateTodo(todoModel);

    return result
        .map((e) => TodoEntity(
              id: e.id,
              description: e.description,
              isCompleted: e.isCompleted,
            ))
        .toList();
  }
}
