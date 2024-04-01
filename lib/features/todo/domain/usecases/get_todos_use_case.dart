import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

// Use case class for getting all todos
class GetTodosUseCase {
  final TodoRepository _todoRepository;

  // Constructor with dependency injection of TodoRepository
  GetTodosUseCase(this._todoRepository);

  // Method to fetch all todos asynchronously
  Future<List<TodoEntity>> call() async {
    // Await the result of fetching todos from TodoRepository
    return await _todoRepository.getTodos();
  }
}
