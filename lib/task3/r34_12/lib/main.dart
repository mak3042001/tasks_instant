import 'package:r34_12/features/main_menu.dart';
import 'injection_container.dart' as di;


void main() {
  print('Starting program...'); // ✅ اختبار
  di.init();
  print('DI initialized'); // ✅ اختبار

  final menu = MainMenu(
    productService: di.sl(),
    postService: di.sl(),
    userService: di.sl(),
  );

  print('Showing main menu...'); // ✅ اختبار
  menu.show();
}