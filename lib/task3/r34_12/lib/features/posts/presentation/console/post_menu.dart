import 'dart:io';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;

  PostMenu(this._postService);

  void showMenu() {
    while (true) {
      print('\n=== POST MANAGEMENT SYSTEM ===');
      print('1. Create new post');
      print('2. Update post');
      print('3. Delete post');
      print('4. Exit');
      print('Enter your choice (1-4): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _createPost();
          break;
        case '2':
          _updatePost();
          break;
        case '3':
          _deletePost();
          break;
        case '4':
          print('Goodbye!');
          exit(0);
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _createPost() {
    print('Enter post title: ');
    final title = stdin.readLineSync();
    print('Enter post description: ');
    final description = stdin.readLineSync();

    if (title != null && title.isNotEmpty &&
        description != null && description.isNotEmpty) {
      _postService.createPost(title, description);
    } else {
      print('All fields are required.');
    }
  }

  void _updatePost() {
    print('Enter post ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new post title: ');
    final title = stdin.readLineSync();
    print('Enter new post description: ');
    final description = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        title != null && title.isNotEmpty &&
        description != null && description.isNotEmpty) {
      _postService.updatePost(id, title, description);
    } else {
      print('All fields are required.');
    }
  }

  void _deletePost() {
    print('Enter post ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.deletePost(id);
    } else {
      print('Post ID is required.');
    }
  }
}