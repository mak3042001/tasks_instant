import 'package:r34_08/core/error/exceptions.dart';
import 'package:r34_08/feature/posts/data/models/posts_models.dart';

abstract class PostRemoteDatasource {
  List<PostsModels> getAllPosts();
  PostsModels getPost(String id);
  PostsModels createPost(PostsModels model);
  PostsModels updatePost(PostsModels model);
  bool deletePosts(String id);
}

class PostRemoteDatasourceImp implements PostRemoteDatasource {
  final _posts = [
    PostsModels(
      id: '1',
      createdBy: 'Mohamed',
      comments: '1',
      description: 'description',
      likes: 3,
    ),
    PostsModels(
      id: '2',
      createdBy: 'Ahmed',
      comments: '2',
      description: 'description2',
      likes: 5,
    ),
  ];

  @override
  PostsModels createPost(PostsModels model) {
    final newModel = model.copyWith(
      id: (DateTime.now().microsecondsSinceEpoch).toString(),
    );
    _posts.add(newModel);
    return newModel;
  }

  @override
  bool deletePosts(String id) {
    final initSize = _posts.length;
    _posts.removeWhere((p) => p.id == id);
    final lastSize = _posts.length;

    return initSize > lastSize;
  }

  @override
  List<PostsModels> getAllPosts() {
    return _posts;
  }

  @override
  PostsModels getPost(String id) {
    try {
      final post = _posts.firstWhere((p) => p.id == id);
      return post;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  PostsModels updatePost(PostsModels model) {
    final index = _posts.indexWhere((p) => p.id == model.id);
    if (index != -1) {
      return _posts[index];
    } else {
      throw ServerException();
    }
  }
}
