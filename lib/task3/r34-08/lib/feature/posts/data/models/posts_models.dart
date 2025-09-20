import 'package:r34_08/feature/posts/domain/entities/posts.dart';

class PostsModels extends Posts {
  PostsModels({
    required super.id,
    required super.createdBy,
    required super.comments,
    required super.description,
    required super.likes,
  });

  factory PostsModels.fromJson(Map<String, dynamic> json) {
    return PostsModels(
      id: json['id'],
      createdBy: json['createdBy'],
      comments: json['comments'],
      description: json['description'],
      likes: json['likes'].toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'comments': comments,
      'description': description,
      'likes': likes,
    };
  }

  PostsModels copyWith({
    String? id,
    String? createdBy,
    String? description,
    int? likes,
    String? comments,
  }) {
    return PostsModels(
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      comments: comments ?? this.comments,
      description: description ?? this.description,
      likes: likes ?? this.likes,
    );
  }
}
