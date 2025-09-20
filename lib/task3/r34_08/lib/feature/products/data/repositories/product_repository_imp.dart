import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/exceptions.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_08/feature/products/data/model/product_model.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class ProductRepositoryImp extends ProductRepository {
  final ProductRemoteDatasource remoteDatasource = ProductRemoteDatasourceImp();

  @override
  Either<Failures, Product> createProducts(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final newProduct = remoteDatasource.createProduct(productModel);
      return Right(newProduct);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, bool> deleteProducts(String id) {
    try {
      final result = remoteDatasource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, List<Product>> getAllProducts() {
    try {
      final listProducts = remoteDatasource.getAllProducts();
      return Right(listProducts);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, Product> getProduct(String id) {
    try {
      final product = remoteDatasource.getProduct(id);
      return Right(product);
    } on ServerException {
      return Left(ServerFailures());
    }
  }

  @override
  Either<Failures, Product> updateProducts(Product product) {
    try {
      final updateProductModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final updateProduct = remoteDatasource.updateProduct(updateProductModel);
      return Right(updateProduct);
    } on ServerException {
      return Left(ServerFailures());
    }
  }
}
