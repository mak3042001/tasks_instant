import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/data/datasources/post_remote-datasource.dart';
import 'package:r34_12/features/posts/data/models/post_model.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, Post> createpost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        description: post.description,
      );
      final createdPost = remoteDataSource.createPost(postModel);
      return Right(createdPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> updatepost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        description: post.description,
      );
      final updatedPost = remoteDataSource.updatePost(postModel);
      return Right(updatedPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deletepost(String id) {
    try {
      final result = remoteDataSource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
