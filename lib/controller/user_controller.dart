import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/config/constant.dart';
import 'package:user_apps/model/post.dart';
import 'package:user_apps/model/user.dart';

class UserController {
  User? _user;
  List posts = [];

  User? get user => _user!;

  set chooseUser(User newUser) => _user = newUser;

  Future<List<User>> getUserData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.userEndpoint);

    try {
      Response response = await http.get(url);

      List dataDecode = jsonDecode(response.body);
      for (int i = 0; i < dataDecode.length; i++) {
        final index = dataDecode[i]['id'];
        dataDecode[i]['photo'] = "assets/user_img/user$index.jpg";
      }

      List<User> result =
          dataDecode.map((user) => User.fromJson(user)).toList();

      for (var post in posts) {
        for (User user in result) {
          if (post['userId'] == user.id) {
            user.post?.add(Post.fromJson(post));
          }
        }
      }

      // print(result[0].post);

      return result;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<User> getUserDataById(int userId) async {
    Uri url =
        Uri.parse("${ApiConstant.baseUrl}${ApiConstant.userEndpoint}/$userId");

    try {
      Response response = await http.get(url);

      Map<String, dynamic> dataDecode = jsonDecode(response.body);
      final index = dataDecode['id'];
      dataDecode['photo'] = "assets/user_img/user$index.jpg";

      User result = User.fromJson(dataDecode);

      return result;
    } catch (error) {
      throw Exception(error);
    }
  }
}
