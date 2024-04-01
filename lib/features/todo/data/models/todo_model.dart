import 'dart:convert';

class TodoModel {
  final String id;
  final String description;
  final bool isCompleted;
  TodoModel({
    required this.id,
    required this.description,
    required this.isCompleted,
  });

  TodoModel copyWith({
    String? id,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] ?? '',
      description: map['description'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TodoModel(id: $id, description: $description, isCompleted: $isCompleted)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.id == id &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ isCompleted.hashCode;
}
