import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/model/post.dart';

import '../config/constant.dart';

class UserController {
  Future<List<Post>> getPostData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);

    try {
      Response response = await http.get(url);
      // List<Map<String, dynamic>> posts = await getPosts();
      List dataDecode = jsonDecode(response.body);
      for (int i = 0; i < dataDecode.length; i++) {
        dataDecode[i]['photo'] = "assets/user_img/user${i + 1}.jpg";
      }

      List<Post> result =
          dataDecode.map((post) => Post.fromJson(post)).toList();

      // for (Map<String, dynamic> post in posts) {
      //   for (User user in result) {
      //     if (post['userId'] == user.id) {
      //       user.post?.add(Post.fromJson(post));
      //     }
      //   }
      // }

      return result;
    } catch (error) {
      throw Exception(error);
    }
  }
}
