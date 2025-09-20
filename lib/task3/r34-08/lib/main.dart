import 'dart:io';

import 'package:r34_08/feature/posts/presentation/console/posts_menu_console.dart';
import 'package:r34_08/feature/posts/presentation/services/posts_menu_services.dart';
import 'package:r34_08/feature/products/presentation/console/product_menu.dart';
import 'package:r34_08/feature/products/presentation/services/product_console_services.dart';

import 'injection_contineer.dart' as di;

void main() {
  print('Initializing product CRUD system ....');

  di.init();

  print('System initialized successfully');

  while (true) {
    final productMenu = ProductMenu(di.sl<ProductConsoleServices>());
    final postMenu = PostsMenuConsole(di.sl<PostsMenuServices>());
    print('1- Products');
    print('2- Posts');
    print('3- Exit');
    print('Please enter number between (1-3)');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        productMenu.showMenu();
      case '2':
        postMenu.showDisplay();
      case '3':
        print('Good bye');
        exit(0);

      default:
        print('Please enter number between (1-3)');
    }
  }
}
