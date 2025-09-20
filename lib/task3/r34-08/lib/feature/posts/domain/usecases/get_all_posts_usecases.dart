import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class GetAllPostsUsecases {
  final PostsRepositories postsRepositories;

  GetAllPostsUsecases({required this.postsRepositories});

  Either<Failures, List<Posts>> call() {
    return postsRepositories.getAllPosts();
  }
}
