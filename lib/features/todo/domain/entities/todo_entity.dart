import 'dart:convert';

class TodoEntity {
  final String id;
  final String description;
  final bool isCompleted;

  // Constructor with named parameters and required keyword for mandatory fields
  TodoEntity({
    required this.id,
    required this.description,
    required this.isCompleted,
  });

  // CopyWith method for creating a new instance with modified properties
  TodoEntity copyWith({
    String? id,
    String? description,
    bool? isCompleted,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  // Convert object to a map for serialization
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  // Factory method to create TodoEntity instance from a map
  factory TodoEntity.fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      id: map['id'] ?? '', // Default value for id in case it's null
      description: map['description'] ??
          '', // Default value for description in case it's null
      isCompleted: map['isCompleted'] ??
          false, // Default value for isCompleted in case it's null
    );
  }

  // Convert object to JSON string
  String toJson() => json.encode(toMap());

  // Factory method to create TodoEntity instance from JSON string
  factory TodoEntity.fromJson(String source) =>
      TodoEntity.fromMap(json.decode(source));

  // Override toString for better debug output
  @override
  String toString() =>
      'TodoEntity(id: $id, description: $description, isCompleted: $isCompleted)';

  // Override equality operator for correct comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoEntity &&
        other.id == id &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  // Override hashCode for correct hashing
  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ isCompleted.hashCode;
}
