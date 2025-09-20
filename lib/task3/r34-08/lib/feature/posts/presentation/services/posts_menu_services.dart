import 'package:r34_08/core/error/messages.dart';
import 'package:r34_08/feature/posts/domain/entities/posts.dart';
import 'package:r34_08/feature/posts/domain/usecases/create_posts_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/delete_post_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/get_all_posts_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/get_post_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/update_post_usecases.dart';

class PostsMenuServices with MapFailureMessage {
  final GetAllPostsUsecases getAllPostsUsecases;
  final GetPostUsecases getPostUsecases;
  final CreatePostsUsecases createPostsUsecases;
  final UpdatePostUsecases updatePostUsecases;
  final DeletePostUsecases deletePostUsecases;

  PostsMenuServices({
    required this.getAllPostsUsecases,
    required this.getPostUsecases,
    required this.createPostsUsecases,
    required this.updatePostUsecases,
    required this.deletePostUsecases,
  });

  void displayAllPosts() {
    final result = getAllPostsUsecases();
    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      posts,
    ) {
      if (posts.isEmpty) {
        print('No posts found');
      } else {
        for (final post in posts) {
          print('====All Posts====');
          print('ID: ${post.id}');
          print('Created by: ${post.createdBy}');
          print('Comments: ${post.comments}');
          print('Description: ${post.description}');
          print('Likes: ${post.likes}');
          print('----');
        }
      }
    });
  }

  void displayPost(String id) {
    final result = getPostUsecases(GetPostsParameter(id: id));
    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      post,
    ) {
      print('====Post Details====');
      print('ID: ${post.id}');
      print('Created by: ${post.createdBy}');
      print('Comments: ${post.comments}');
      print('Description: ${post.description}');
      print('Likes: ${post.likes}');
    });
  }

  void createPost(
    String createdBy,
    String comments,
    String description,
    int likes,
  ) {
    final post = Posts(
      id: '',
      createdBy: createdBy,
      description: description,
      likes: likes,
      comments: comments,
    );

    final result = createPostsUsecases(
      CreatePostsUsecasesPrameter(posts: post),
    );

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      newPost,
    ) {
      print('New post has been created successfully with ID: ${newPost.id}');
    });
  }

  void updatePost(
    String id,
    String createdBy,
    String comments,
    String description,
    int likes,
  ) {
    final post = Posts(
      id: id,
      createdBy: createdBy,
      description: description,
      likes: likes,
      comments: comments,
    );

    final result = updatePostUsecases(UpdatePostParameter(posts: post));

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      newPost,
    ) {
      print('post with ID (${newPost.id}) has been updated');
    });
  }

  void deletePost(String id) {
    final result = deletePostUsecases(DeletePostParameter(id: id));

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      success,
    ) {
       print(success ? 'Post has been deleted successfully':'This ID has been not found, Try again');
    });
  }
}
