import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

// Use case class for adding a todo
class AddTodoUseCase {
  final TodoRepository _todoRepository;

  // Constructor with dependency injection of TodoRepository
  AddTodoUseCase(this._todoRepository);

  // Method to add a todo asynchronously
  Future<List<TodoEntity>> call(TodoEntity todoEntity) async {
    // Await the result of adding todo from TodoRepository
    return await _todoRepository.addTodo(todoEntity);
  }
}
