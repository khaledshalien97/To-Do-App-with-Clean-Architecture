import 'package:dartz/dartz.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/entities.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/repository_Interface.dart';

class GetPostsUseCase {
  final PostRepoditoryInterFace repoditoryInterFace;

  GetPostsUseCase(this.repoditoryInterFace);

  Future<Either<String, List<PostDataEntity>>> call() async {
    return await repoditoryInterFace.getPosts();
  }
}
