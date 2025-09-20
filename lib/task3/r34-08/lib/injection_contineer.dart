import 'package:get_it/get_it.dart';
import 'package:r34_08/feature/posts/data/datasources/data_sources.dart';
import 'package:r34_08/feature/posts/data/repositories/post_repository_imp.dart';
import 'package:r34_08/feature/posts/domain/repositories/posts_repositories.dart';
import 'package:r34_08/feature/posts/domain/usecases/create_posts_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/delete_post_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/get_all_posts_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/get_post_usecases.dart';
import 'package:r34_08/feature/posts/domain/usecases/update_post_usecases.dart';
import 'package:r34_08/feature/posts/presentation/services/posts_menu_services.dart';
import 'package:r34_08/feature/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_08/feature/products/data/repositories/product_repository_imp.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';
import 'package:r34_08/feature/products/domain/usecases/create_product.dart';
import 'package:r34_08/feature/products/domain/usecases/delete_product.dart';
import 'package:r34_08/feature/products/domain/usecases/get_all_product.dart';
import 'package:r34_08/feature/products/domain/usecases/get_product.dart';
import 'package:r34_08/feature/products/domain/usecases/update_product.dart';
import 'package:r34_08/feature/products/presentation/services/product_console_services.dart';

final sl = GetIt.instance;
void init() {
  //dataSource
    //?product
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImp(),
  );
    //?post
  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImp(),
  );

  //repository
    //?product
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(remoteDatasource: sl()),
  );

    //?post
  sl.registerLazySingleton<PostsRepositories>(
    () => PostRepositoryImp(postRemoteDatasource: sl()),
  );

  //useCase
    //?product
  sl.registerLazySingleton<GetAllProduct>(() => GetAllProduct(sl()));
  sl.registerLazySingleton<GetProduct>(() => GetProduct(sl()));
  sl.registerLazySingleton<CreateProduct>(() => CreateProduct(sl()));
  sl.registerLazySingleton<UpdateProduct>(() => UpdateProduct(sl()));
  sl.registerLazySingleton<DeleteProduct>(() => DeleteProduct(sl()));

    //?post

  sl.registerLazySingleton<GetAllPostsUsecases>(() => GetAllPostsUsecases(postsRepositories: sl()));
  sl.registerLazySingleton<GetPostUsecases>(() => GetPostUsecases(postsRepositories: sl()));
  sl.registerLazySingleton<CreatePostsUsecases>(() => CreatePostsUsecases(postsRepositories: sl()));
  sl.registerLazySingleton<UpdatePostUsecases>(() => UpdatePostUsecases(postsRepositories: sl()));
  sl.registerLazySingleton<DeletePostUsecases>(() => DeletePostUsecases(postsRepositories: sl()));

  //services
    //?product
  sl.registerLazySingleton<ProductConsoleServices>(
    () => ProductConsoleServices(
      getAllProductUsecase: sl(),
      getProductUsecase: sl(),
      createProductUsecase: sl(),
      updateProductUsecase: sl(),
      deleteProductUsecase: sl(),
    ),
  );

    //?post

  sl.registerLazySingleton<PostsMenuServices>(
    () => PostsMenuServices(
      getAllPostsUsecases: sl(),
      getPostUsecases: sl(),
      createPostsUsecases: sl(),
      updatePostUsecases: sl(),
      deletePostUsecases: sl(),
    ),
  );
}
