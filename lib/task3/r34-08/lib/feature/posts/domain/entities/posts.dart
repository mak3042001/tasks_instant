import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final String id;
  final String createdBy;
  final String description;
  final int likes;
  final String comments;

  Posts({
    required this.id,
    required this.createdBy,
    required this.description,
    required this.likes,
    required this.comments,
  });

  @override
  List<Object?> get props => [id];
}
