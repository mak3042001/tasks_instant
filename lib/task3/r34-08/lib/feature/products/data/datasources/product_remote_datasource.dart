import 'package:r34_08/core/error/exceptions.dart';
import 'package:r34_08/feature/products/data/model/product_model.dart';

abstract class ProductRemoteDatasource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel updateProduct(ProductModel product);
  ProductModel createProduct(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDatasourceImp implements ProductRemoteDatasource {
  final List<ProductModel> _product = [
    ProductModel(
      id: "1",
      name: "name1",
      description: "description1",
      price: 100,
    ),
    ProductModel(
      id: "2",
      name: "name2",
      description: "description2",
      price: 200,
    ),
  ];

  @override
  ProductModel createProduct(ProductModel product) {
    final newProduct = product.copyWith(
      id: (DateTime.now().microsecondsSinceEpoch).toString(),
    );

    _product.add(newProduct);
    return newProduct;
  }

  @override
  bool deleteProduct(String id) {
    final initLength = _product.length;
    _product.removeWhere((p) => p.id == id);
    final productLength = _product.length;
    return productLength < initLength;
  }

  @override
  List<ProductModel> getAllProducts() {
    return _product;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _product.firstWhere((p) => p.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel updateProduct(ProductModel product) {
    final index = _product.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _product[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }
}
