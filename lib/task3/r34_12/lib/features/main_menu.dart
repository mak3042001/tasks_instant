import 'dart:io';

class MainMenu {
  final dynamic productService;
  final dynamic postService;
  final dynamic userService;

  MainMenu({
    required this.productService,
    required this.postService,
    required this.userService,
  });

  void show() {
    print('\n==== Main Menu ====');
    print('1. Product Menu');
    print('2. Post Menu');
    print('3. User Menu');
    print('0. Exit');
    stdout.write('Enter choice: ');

    final choice = stdin.readLineSync();
    print('You entered: $choice'); // ✅ اختبار
  }
}