import 'package:equatable/equatable.dart';
class Post extends Equatable {
  final String id;
  final String name;

  const Post({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}