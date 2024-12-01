import 'package:equatable/equatable.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/entities.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostDataEntity> posts;
  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
