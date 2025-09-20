import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class CreatePostsUsecases {
  final PostsRepositories postsRepositories;

  CreatePostsUsecases({required this.postsRepositories});

  Either<Failures, Posts> call(CreatePostsUsecasesPrameter parameter) {
    return postsRepositories.createPosts(parameter.posts);
  }
}

class CreatePostsUsecasesPrameter extends Equatable {
  final Posts posts;

  CreatePostsUsecasesPrameter({required this.posts});
  
  @override
  List<Object?> get props => [posts];
}
