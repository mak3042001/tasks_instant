import 'dart:io';

import 'package:r34_08/feature/products/presentation/services/product_console_services.dart';

class ProductMenu {
  final ProductConsoleServices _productConsoleServices;

  ProductMenu(this._productConsoleServices);

  void showMenu() {
    productMenu:
    while (true) {
      print('1- List all products');
      print('2- Show product details');
      print('3- Create product');
      print('4- update product');
      print('5- Delete product');
      print('6- Exit');
      print('7- Main menu');
      print('Please enter number between (1-7)');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _productConsoleServices.displayAllProduct();
          break;
        case '2':
          _getProductDetails();
          break;
        case '3':
          _createProduct();
          break;
        case '4':
          _updateProduct();
          break;
        case '5':
          _deleteProduct();
          break;
        case '6':
          print('Good bye!');
          exit(0);

        case '7':
          break productMenu;
        default:
          print('Invalid number please try again with number from 1 to 7');
      }
    }
  }

  void _getProductDetails() {
    print('Please enter product ID');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _productConsoleServices.displayProduct(id);
    }
  }

  void _createProduct() {
    print('Please enter product name: ');
    final name = stdin.readLineSync();
    print('Please enter product description: ');
    final description = stdin.readLineSync();
    print('Please enter product price: ');
    final pricestr = stdin.readLineSync();
    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        pricestr != null &&
        pricestr.isNotEmpty) {
      try {
        final price = double.parse(pricestr);
        _productConsoleServices.createNewProduct(name, description, price);
      } catch (e) {
        print('Invalid price format, please enter a valid number');
      }
    } else {
      print('Please all fields required');
    }
  }

  void _updateProduct() {
    print('Please enter product ID: ');
    final id = stdin.readLineSync();
    print('Please enter product name: ');
    final name = stdin.readLineSync();
    print('Please enter product description: ');
    final description = stdin.readLineSync();
    print('Please enter product price: ');
    final pricestr = stdin.readLineSync();
    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        pricestr != null &&
        pricestr.isNotEmpty) {
      try {
        final price = double.parse(pricestr);
        _productConsoleServices.updateProduct(id, name, description, price);
      } catch (e) {
        print('Invalid price format, please enter a valid number');
      }
    } else {
      print('Please all fields required');
    }
  }

  void _deleteProduct() {
    print('Please enter product ID: ');
    final id = stdin.readLineSync();

    if (id != null && id.isNotEmpty) {
      _productConsoleServices.deleteProduct(id);
    } else {
      print('Invalid product ID');
    }
  }
}
