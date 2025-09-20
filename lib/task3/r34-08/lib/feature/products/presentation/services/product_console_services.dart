import 'package:r34_08/core/error/messages.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/usecases/create_product.dart';
import 'package:r34_08/feature/products/domain/usecases/delete_product.dart';
import 'package:r34_08/feature/products/domain/usecases/get_all_product.dart';
import 'package:r34_08/feature/products/domain/usecases/get_product.dart';
import 'package:r34_08/feature/products/domain/usecases/update_product.dart';

class ProductConsoleServices with MapFailureMessage {
  final GetAllProduct getAllProductUsecase;
  final GetProduct getProductUsecase;
  final CreateProduct createProductUsecase;
  final UpdateProduct updateProductUsecase;
  final DeleteProduct deleteProductUsecase;

  ProductConsoleServices({
    required this.getAllProductUsecase,
    required this.getProductUsecase,
    required this.createProductUsecase,
    required this.updateProductUsecase,
    required this.deleteProductUsecase,
  });

  void displayAllProduct() {
    final result = getAllProductUsecase();

    result.fold((failure) => print('Error is ${mapFailureMessage(failure)}'), (
      products,
    ) {
      if (products.isEmpty) {
        print('No products found');
      } else {
        print('\n====Products====');
        for (final product in products) {
          print('ID: ${product.id}');
          print('Name: ${product.name}');
          print('Description: ${product.description}');
          print('Price: ${(product.price).toStringAsFixed(2)}');
          print('----');
        }
      }
    });
  }

  void displayProduct(String id) {
    final result = getProductUsecase(GetProductPrameter(id: id));

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      product,
    ) {
      print('====Product details====');
      print('ID: ${product.id}');
      print('Name: ${product.name}');
      print('Description: ${product.description}');
      print('Price: ${(product.price.toStringAsFixed(2))}');

      print('--------------');
    });
  }

  void createNewProduct(String name, String description, double price) {
    final product = Product(
      id: '',
      name: name,
      description: description,
      price: price,
    );

    final result = createProductUsecase(
      CreateProductPrameter(product: product),
    );

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      newProduct,
    ) {
      print('New product has been created with ID ${newProduct.id}');
      print('----');
    });
  }

  void updateProduct(String id, String name, String description, double price) {
    final product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );

    final result = updateProductUsecase(
      UpdateProductPrameter(product: product),
    );

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      NewProduct,
    ) {
      print(
        'This product has been updated successfully with ID ${NewProduct.id}',
      );

      print('----');
    });
  }

  void deleteProduct(String id) {
    final result = deleteProductUsecase(DeleteProductPrameter(id: id));

    result.fold((failure) => print('Error: ${mapFailureMessage(failure)}'), (
      success,
    ) {
      print(
        success ? 'product has been deleted successfully' : 'product not found',
      );
      print('----');
    });
  }
}
