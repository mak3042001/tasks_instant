import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';

abstract class PostsRepositories {
  Either<Failures, List<Posts>> getAllPosts();
  Either<Failures, Posts> getPost(String id);
  Either<Failures, Posts> createPosts(Posts post);
  Either<Failures, Posts> updatePosts(Posts post);
  Either<Failures, bool> deletePosts(String id);
}
