import 'dart:io';

import 'package:r34_02/features/users/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userConsoleService;

  UserMenu(this._userConsoleService);
  void showMenu() {
    while (true) {
      print("\n  ===== USER MANAGEMENT SYSTEM  =====");
      print("1.List All Users");
      print("2.View User Details");
      print("3.Create New User");
      print("4.Update User");
      print("5.Delete User");
      print("6.Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          print("***********************************\n");
          _userConsoleService.displayAllUsers();
          print("***********************************");
          break;
        case '2':
          print("***********************************\n");
          _viewUserMenu();
          print("***********************************");
          break;
        case '3':
          print("***********************************\n");
          _createUserMenu();
          print("***********************************");

          break;
        case '4':
          print("***********************************\n");
          _updateUserMenu();
          break;
        case '5':
          print("***********************************\n");
          _deleteUserMenu();
          print("***********************************");

          break;
        case '6':
          return;
        default:
          print("invalid choise, please try again");
      }
    }
  }

  void _viewUserMenu() {
    print("Enter User ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userConsoleService.displayUser(id);
    }
  }

  void _createUserMenu() {
    print("Enter User Name:");
    final name = stdin.readLineSync();
    print("Enter User Email:");
    final email = stdin.readLineSync();
    print("Enter User Gender:");
    final gender = stdin.readLineSync();
    if (name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty &&
        gender != null &&
        gender.isNotEmpty) {
      _userConsoleService.createUser(name, email, gender);
    } else {
      print("All Fields are required,please");
    }
  }

  void _updateUserMenu() {
    print("Enter User ID:");
    final id = stdin.readLineSync();
    print("Enter new User Name:");
    final newName = stdin.readLineSync();
    print("Enter new User Email:");
    final newEmail = stdin.readLineSync();
    print("Enter new User Gender:");
    final newGender = stdin.readLineSync();
    if (id != null &&
        id.isNotEmpty &&
        newName != null &&
        newName.isNotEmpty &&
        newEmail != null &&
        newEmail.isNotEmpty &&
        newGender != null &&
        newGender.isNotEmpty) {
      _userConsoleService.updateUser(id, newName, newEmail, newGender);
    } else {
      print("All Fields are required,please");
    }
  }

  void _deleteUserMenu() {
    print("Enter User ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userConsoleService.deleteUser(id);
    }
  }
}
