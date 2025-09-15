import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/usecase/create_post.dart';
import 'package:r34_12/features/posts/domain/usecase/update_post.dart';
import 'package:r34_12/features/posts/domain/usecase/delete_post.dart';

class PostConsoleService with FailureMessages {
  late final Createpost createPostUseCase;
  late final UpdatePost updatePostUseCase;
  late final Deletepost deletePostUseCase;

  PostConsoleService({
    required this.createPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });

  void createPost(String title, String description) {
    final post = Post(
      id: '',
      title: title,
      description: description, content: '',
    );

    final result = createPostUseCase(CreatepostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (_) => print('post created successfully'),
    );
  }

  void updatePost(String id, String title, String description) {
    final post = Post(
      id: id,
      title: title,
      description: description, content: '',
    );

    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (_) => print('post updated successfully'),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(DeletepostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) =>
          print(success ? 'post deleted successfully' : 'post not found'),
    );
  }
}