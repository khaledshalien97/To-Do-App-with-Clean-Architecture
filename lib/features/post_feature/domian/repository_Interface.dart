import 'package:dartz/dartz.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/entities.dart';

abstract class PostRepoditoryInterFace {
  Future<Either<String, List<PostDataEntity>>> getPosts();
}
