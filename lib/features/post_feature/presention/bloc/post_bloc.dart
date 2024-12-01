

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/use_cases.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/bloc/post_event.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
   GetPostsUseCase getPostsUseCase;

  PostBloc(this.getPostsUseCase) : super(PostInitial()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(PostLoading());
      final result = await getPostsUseCase();
      result.fold(
        (error) => emit(PostError(error)),
        (posts) => emit(PostLoaded(posts)),
      );
    });
  }
}
