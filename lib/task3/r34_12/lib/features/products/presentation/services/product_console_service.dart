import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/usecase/create_product.dart';
import 'package:r34_12/features/products/domain/usecase/delete_product.dart';
import 'package:r34_12/features/products/domain/usecase/get_all_product.dart';
import 'package:r34_12/features/products/domain/usecase/get_product.dart';
import 'package:r34_12/features/products/domain/usecase/update_product.dart';

class ProductConsoleService with FailureMessages {
  late final GetAllProducts getAllProductUseCase;
  late final GetProduct getProductUseCase;
  late final CreateProduct createProductUseCase;
  late final UpdateProduct updateProductUseCase;
  late final DeleteProduct deleteProductUseCase;


  ProductConsoleService({
    required this.createProductUseCase,
    required this.getAllProductUseCase,
    required this.getProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase
  });


  void displayAllProduct(){
      final result = getAllProductUseCase();
      result.fold(
      (Failure) => print('Error:${mapFailureToMessage(Failure)}'),
      (Product) {
        if (Product.isEmpty){
          print('No products found.');
        } else{
          print('\n=== Products ===');
          for(final Product in Product ) {
            print('ID: ${Product.id}');
            print('Name: ${Product.name}');
            print('Description: ${Product.description}');
            print('Price: ${Product.price.toStringAsFixed(2)}');
            print('---');
          }
        }
      },
    );   
  }

  void displayProduct(String id){
    final result = getProductUseCase(GetProductParams(id: id));
    result.fold(
      (Failure) => print('Error:${mapFailureToMessage(Failure)}'),
      (Product) {
        print('\n=== Product Details ===');
        print('ID: ${Product.id}');
        print('Name: ${Product.name}');
        print('Description: ${Product.description}');
        print('Price: ${Product.price.toStringAsFixed(2)}');

      },
    );
  }

  void createProduct(String name, String description, double price){
    final product = Product(
      id: '', 
      name: name, 
      description: description, 
      price: price,
      );
  }

  void updateProduct(String id, String name, String description, double price){
    final product = Product(
      id: id, 
      name: name, 
      description: description, 
      price: price,
    );

    final result = updateProductUseCase(UpdateProductParams(product: product));
    result.fold(
      (Failure) => print('Error:${mapFailureToMessage(Failure)}'), 
      (updateProduct) =>print('product updated successfully'),
    );
  }

  void deleteProduct(String id){
    final result = deleteProductUseCase(DeleteProductParams(id: id));
    result.fold(
      (Failure) => print('Error:${mapFailureToMessage(Failure)}'), 
      (success) => print(success ? 'product deldted successfully': 'Product not found'),
    );
  }
}