import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/model/post.dart';

import '../config/constant.dart';

class PostController {
  Future<List<Post>> getPostData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);
    try {
      Response response = await http.get(url);
      // List<Map<String, dynamic>> posts = await getPosts();
      List dataDecode = jsonDecode(response.body);
      List<Post> dataposting = dataDecode.map((e) => Post.fromJson(e)).toList();
      dataposting.shuffle();
      return dataposting;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> sendNewPost(int userId,
      {String? title, String? description}) async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);
    try {
      Object data = {
        "title": title,
        "body": description,
        "userId": userId.toString(),
      };
      Response response = await http.post(url, body: data);
      print(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
