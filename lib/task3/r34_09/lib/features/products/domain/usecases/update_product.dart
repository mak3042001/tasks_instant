import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository); 
  Future<Either<Failure, Product>> call(UpdateProductparams params) {
    return repository.updateProducts( params.product);
  }
}

class UpdateProductparams extends Equatable {
   final Product product;

  const UpdateProductparams({ required this.product});
  @override
  List<Object?> get props => [ product];
}
