import 'dart:convert';

import 'package:to_do_app_clean_arch/features/post_feature/data/model.dart';
import 'package:http/http.dart' as http;

class PostDataSource {

  Future<List<PostDataModel>> getAllPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
       return json.decode(utf8.decode(response.bodyBytes)).map<PostDataModel>((m) => PostDataModel.fromJson(m)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
