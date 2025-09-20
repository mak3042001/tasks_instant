import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class DeletePostUsecases {
  final PostsRepositories postsRepositories;

  DeletePostUsecases({required this.postsRepositories});

  Either<Failures, bool> call(DeletePostParameter parameter) {
    return postsRepositories.deletePosts(parameter.id);
  }
}

class DeletePostParameter extends Equatable {
  final String id;

  DeletePostParameter({required this.id});
  
  @override
  
  List<Object?> get props => [id];

  
}
