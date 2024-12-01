import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_app_clean_arch/features/post_feature/data/data_source.dart';
import 'package:to_do_app_clean_arch/features/post_feature/data/repository_Implementation.dart';
import 'package:to_do_app_clean_arch/features/post_feature/domian/use_cases.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/bloc/post_bloc.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/bloc/post_event.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/pages/postsHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postRemoteDataSource = PostDataSource();
    final postRepository = PostRepositoryImp(postRemoteDataSource);
    final getPostsUseCase = GetPostsUseCase(postRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      home: BlocProvider(
        create: (_) => PostBloc(getPostsUseCase)..add(LoadPostsEvent()),
        child: const PostsHomePage(),
      ),
    );
  }
}
