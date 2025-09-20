import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/exceptions.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/posts/data/datasources/data_sources.dart';
import 'package:r34_08/feature/posts/data/models/posts_models.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';

class PostRepositoryImp implements PostsRepositories {
  final PostRemoteDatasource postRemoteDatasource;

  PostRepositoryImp({required this.postRemoteDatasource});

  @override
  Either<Failures, Posts> createPosts(Posts post) {
    try {
      final postModel = PostsModels(
        id: post.id,
        createdBy: post.createdBy,
        comments: post.comments,
        description: post.description,
        likes: post.likes,
      );
      final result = postRemoteDatasource.createPost(postModel);
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, bool> deletePosts(String id) {
    try {
      final result = postRemoteDatasource.deletePosts(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, List<Posts>> getAllPosts() {
    try {
      final result = postRemoteDatasource.getAllPosts();
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, Posts> getPost(String id) {
    try {
      final result = postRemoteDatasource.getPost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, Posts> updatePosts(Posts post) {
    try {
      final postt = PostsModels(
        id: post.id,
        createdBy: post.createdBy,
        comments: post.comments,
        description: post.description,
        likes: post.likes,
      );
      final result = postRemoteDatasource.updatePost(postt);
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }
}
