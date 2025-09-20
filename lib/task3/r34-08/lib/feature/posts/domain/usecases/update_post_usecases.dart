import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class UpdatePostUsecases {
  final PostsRepositories postsRepositories;

  UpdatePostUsecases({required this.postsRepositories});

  Either<Failures, Posts> call(UpdatePostParameter parameter) {
    return postsRepositories.updatePosts(parameter.posts);
  }
}

class UpdatePostParameter extends Equatable {
  final Posts posts;

  UpdatePostParameter({required this.posts});
  
  @override
  
  List<Object?> get props => [posts];
}
