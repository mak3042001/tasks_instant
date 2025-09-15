import 'dart:io';
import 'package:r34_12/features/users/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userService;

  UserMenu(this._userService);

  void showMenu() {
    while (true) {
      print('\n=== USER MANAGEMENT SYSTEM ===');
      print('1. Add new user');
      print('2. Update user');
      print('3. Delete user');
      print('4. Exit');
      print('Enter your choice (1-4): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _addUser();
          break;
        case '2':
          _updateUser();
          break;
        case '3':
          _deleteUser();
          break;
        case '4':
          print('Goodbye!');
          exit(0);
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _addUser() {
    print('Enter user ID: ');
    final id = stdin.readLineSync();

    if (id != null && id.isNotEmpty) {
      _userService.addUser(id);
    } else {
      print('User ID is required.');
    }
  }

  void _updateUser() {
    print('Enter user ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new user name: ');
    final name = stdin.readLineSync();
    print('Enter new user email: ');
    final email = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        name != null && name.isNotEmpty &&
        email != null && email.isNotEmpty) {
      _userService.updateUser(id, name, email);
    } else {
      print('All fields are required.');
    }
  }

  void _deleteUser() {
    print('Enter user ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userService.deleteUser(id);
    } else {
      print('User ID is required.');
    }
  }
}