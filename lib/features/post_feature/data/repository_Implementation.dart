import 'package:dartz/dartz.dart';
import 'package:to_do_app_clean_arch/features/post_feature/data/data_source.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/entities.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/repository_Interface.dart';

class PostRepositoryImp implements PostRepoditoryInterFace {
  final PostDataSource postDataSource;
  PostRepositoryImp(this.postDataSource);
  @override
  Future<Either<String, List<PostDataEntity>>> getPosts() async {
    try {
      final posts = await postDataSource.getAllPosts();
      return Right(posts
          .map((post) =>
              PostDataEntity(id: post.id, title: post.title, body: post.body))
          .toList());
    } catch (error) {
      return Left(error.toString());
    }
  }
}
