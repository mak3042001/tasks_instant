import 'dart:io';

import 'package:r34_08/feature/posts/presentation/services/posts_menu_services.dart';

class PostsMenuConsole {
  final PostsMenuServices _postsMenuServices;

  PostsMenuConsole(this._postsMenuServices);

  void showDisplay() {
    postMenu:
    while (true) {
      print('1- List all posts');
      print('2- Show post details');
      print('3- Create post');
      print('4- update post');
      print('5- Delete post');
      print('6- Exit');
      print('7- Main menu');
      print('Please enter number between (1-7)');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _postsMenuServices.displayAllPosts();
          break;
        case '2':
          _getPostDisplay();
          break;
        case '3':
          _createPostDisplay();
          break;
        case '4':
          _updatePostDisplay();
          break;
        case '5':
          _deletePost();
          break;
        case '6':
          print('Good bye!');
          exit(0);
        case '7':
          break postMenu;
        default:
          print('Invalid choice please enter number between 1-7');
      }
    }
  }

  void _getPostDisplay() {
    print('Please enter post ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postsMenuServices.displayPost(id);
    }
  }

  void _createPostDisplay() {
    print('Please enter name for creator');
    final createdBy = stdin.readLineSync();
    print('Please enter comments');
    final comment = stdin.readLineSync();
    print('Please enter description');
    final description = stdin.readLineSync();
    print('Please enter number for likes');
    final likes = stdin.readLineSync();

    if (createdBy != null &&
        createdBy.isNotEmpty &&
        comment != null &&
        comment.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        likes != null &&
        likes.isNotEmpty) {
      try {
        final likesInt = int.parse(likes);
        _postsMenuServices.createPost(
          createdBy,
          comment,
          description,
          likesInt,
        );
      } catch (e) {
        print('format for likes wrong, Please enter number');
      }
    } else {
      print('All fields are required');
    }
  }

  void _updatePostDisplay() {
    print('Please enter ID');
    final id = stdin.readLineSync();
    print('Please enter name for creator');
    final createdBy = stdin.readLineSync();
    print('Please enter comments');
    final comment = stdin.readLineSync();
    print('Please enter description');
    final description = stdin.readLineSync();
    print('Please enter number for likes');
    final likes = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        createdBy != null &&
        createdBy.isNotEmpty &&
        comment != null &&
        comment.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        likes != null &&
        likes.isNotEmpty) {
      try {
        final likesInt = int.parse(likes);
        _postsMenuServices.updatePost(
          id,
          createdBy,
          comment,
          description,
          likesInt,
        );
      } catch (e) {
        print('format for likes wrong, Please enter number');
      }
    } else {
      print('All fields are required');
    }
  }

  void _deletePost() {
    print('Please enter post ID: ');
    final id = stdin.readLineSync();

    if (id != null && id.isNotEmpty) {
      _postsMenuServices.deletePost(id);
    } else {
      print('Invalid post ID');
    }
  }
}
