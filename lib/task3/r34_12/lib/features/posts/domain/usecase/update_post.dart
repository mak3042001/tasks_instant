import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/post_repository.dart';
import '../entities/post.dart';

class UpdatePost {
  final PostRepository repository;
  UpdatePost(this.repository);

  Either<Failure, Post> call(UpdatePostParams params) {
    return repository.updatepost(params.post);
  }
}

class UpdatePostParams extends Equatable {
  final Post post;
  const UpdatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}