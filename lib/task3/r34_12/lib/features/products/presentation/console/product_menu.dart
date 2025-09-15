import 'dart:io';
import 'package:r34_12/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
    final ProductConsoleService _ProductServices;

    ProductMenu(this._ProductServices);

    void showMenu(){
        while (true){
            print('\n=== PRODUCT MANAGEMENT SYSTEM ===');
            print('1. List all products');
            print('2. View product details');
            print('3. Create new product');
            print('4. Update product');
            print('5. Delete product');
            print('6. Exit');
            print('Enter your choise (1-6):');

            final choise = stdin.readLineSync();

            switch (choise) {
                case '1':
                 _ProductServices.displayAllProduct();
                 break;
                case '2':
                 _viewProduct();
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
                 print('Goodbye!');
                 exit(0);
                default:
                 print('Invalid choise. please try again.');

            }
        }
    }
    void _viewProduct(){}







    void _createProduct(){
        print('Enter product name: ');
        final name = stdin.readLineSync();
        print('Enter product description: ');
        final description = stdin.readLineSync();
        print('Enter product price: ');
        final priceStr = stdin.readLineSync();

        if (name != null && name.isEmpty &&
            description != null && description.isEmpty &&
            priceStr != null && priceStr.isEmpty){
          try {
            final price = double.parse(priceStr);
            _ProductServices.createProduct(name, description, price);
          }catch(e){
            print('Invalid price format. please enter a valid number.');
          }
        }else{
            print('All fields are required.');
        }
    }

    void _updateProduct(){
        print('Enter product ID to update: ');
        final id = stdin.readLineSync();
        print('Enter new product name: ');
        final name = stdin.readLineSync();
        print('Enter new product description: ');
        final description = stdin.readLineSync();
        print('Enter new product price: ');
        final priceStr = stdin.readLineSync();

        if (id != null && id.isEmpty &&
            name != null && name.isEmpty &&
            description != null && description.isEmpty &&
            priceStr != null && priceStr.isEmpty){
          try {
            final price = double.parse(priceStr);
            _ProductServices.updateProduct(id,name, description, price);
          }catch(e){
            print('Invalid price format. please enter a valid number.');
          }
        }else{
            print('All fields are required.');
        }
    }

    void _deleteProduct(){
        print('Enter product ID to delete: ');
        final id = stdin.readLineSync();
        if (id != null && id.isNotEmpty){
            _ProductServices.deleteProduct(id);
        }
    }
}