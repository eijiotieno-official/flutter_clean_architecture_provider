import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

// Use case class for updating a todo
class UpdateTodoUseCase {
  final TodoRepository _todoRepository;

  // Constructor with dependency injection of TodoRepository
  UpdateTodoUseCase(this._todoRepository);

  // Method to update a todo asynchronously
  Future<List<TodoEntity>> call(TodoEntity todoEntity) async {
    // Await the result of updating todo from TodoRepository
    return await _todoRepository.updateTodo(todoEntity);
  }
}
