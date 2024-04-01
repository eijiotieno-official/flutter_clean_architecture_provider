import 'package:clean_architecture_provider/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_provider/features/todo/domain/repositories/todo_repository.dart';

// Use case class for deleting a todo
class DeleteTodoUseCase {
  final TodoRepository _todoRepository;

  // Constructor with dependency injection of TodoRepository
  DeleteTodoUseCase(this._todoRepository);

  // Method to delete a todo asynchronously
  Future<List<TodoEntity>> call(String id) async {
    // Await the result of deleting todo from TodoRepository
   return await _todoRepository.deleteTodo(id);
  }
}
