import 'package:get_it/get_it.dart';


// Product
import 'package:r34_12/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_12/features/products/data/repositories/product_repository_impl.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:r34_12/features/products/domain/usecase/create_product.dart';
import 'package:r34_12/features/products/domain/usecase/delete_product.dart';
import 'package:r34_12/features/products/domain/usecase/get_all_product.dart';
import 'package:r34_12/features/products/domain/usecase/get_product.dart';
import 'package:r34_12/features/products/domain/usecase/update_product.dart';
import 'package:r34_12/features/products/presentation/services/product_console_service.dart';
// Post
import 'package:r34_12/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_12/features/posts/data/repositories/post_repository_impl.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_12/features/posts/domain/usecase/create_post.dart';
import 'package:r34_12/features/posts/domain/usecase/delete_post.dart';
import 'package:r34_12/features/posts/domain/usecase/update_post.dart';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';
// User
import 'package:r34_12/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_12/features/users/data/repositories/user_repository_impl.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:r34_12/features/users/domain/usecase/adduser.dart';
import 'package:r34_12/features/users/domain/usecase/delete_user.dart';
import 'package:r34_12/features/users/domain/usecase/update_user.dart';
import 'package:r34_12/features/users/presentation/services/user_console_service.dart';

final sl = GetIt.instance;

void init() {
  // ---------------- Product ----------------
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDatasourceImpl());

  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  sl.registerLazySingleton(() => ProductConsoleService(
        createProductUseCase: sl(),
        getAllProductUseCase: sl(),
        getProductUseCase: sl(),
        updateProductUseCase: sl(),
        deleteProductUseCase: sl(),
      ));

  // ---------------- Post ----------------
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl());

  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => Createpost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => Deletepost(sl()));

  sl.registerLazySingleton(() => PostConsoleService(
        createPostUseCase: sl(),
        updatePostUseCase: sl(),
        deletePostUseCase: sl(),
      ));

  // ---------------- User ----------------
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => Adduser(sl()));
  sl.registerLazySingleton(() => Updateuser(sl()));
  sl.registerLazySingleton(() => Deleteuser(sl()));

  sl.registerLazySingleton(() => UserConsoleService(
        addUserUseCase: sl(),
        updateUserUseCase: sl(),
        deleteUserUseCase: sl(),
      ));
}