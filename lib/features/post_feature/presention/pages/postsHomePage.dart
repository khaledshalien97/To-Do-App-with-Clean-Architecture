import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_clean_arch/features/post_feature/presention/bloc/post_state.dart';

import '../bloc/post_bloc.dart';

class PostsHomePage extends StatefulWidget {
  const PostsHomePage({super.key});

  @override
  State<PostsHomePage> createState() => _PostsHomePageState();
}

class _PostsHomePageState extends State<PostsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts List'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)),
                  child: ListTile(
                    title: Text(
                      post.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No Posts'));
        },
      ),
    );
  }
}
