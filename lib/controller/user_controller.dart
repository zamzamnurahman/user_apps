import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/config/constant.dart';
import 'package:user_apps/model/user.dart';

class UserController {
  User? _user;

  User? get user => _user!;

  set chooseUser(User newUser) => _user = newUser;

  Future<List<User>> getUserData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.userEndpoint);

    try {
      Response response = await http.get(url);
      // List<Map<String, dynamic>> posts = await getPosts();
      List dataDecode = jsonDecode(response.body);
      for (int i = 0; i < dataDecode.length; i++) {
        dataDecode[i]['photo'] = "assets/user_img/user${i + 1}.jpg";
      }

      List<User> result =
          dataDecode.map((user) => User.fromJson(user)).toList();

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

  Future getPosts() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);
    try {
      Response response = await http.get(url);
      print(response.body);
      List dataDecode = jsonDecode(response.body);
      return dataDecode;
    } catch (e) {
      throw Exception(e);
    }
  }
}
