import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class GetPostUsecases {
  final PostsRepositories postsRepositories;

  GetPostUsecases({required this.postsRepositories});

  Either<Failures, Posts> call(GetPostsParameter parameter) {
    return postsRepositories.getPost(parameter.id);
  }
}

class GetPostsParameter extends Equatable {
  final String id;

  GetPostsParameter({required this.id});
  
  @override
  List<Object?> get props => [id];
}
