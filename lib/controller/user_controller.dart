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
      List dataDecode = jsonDecode(response.body);
      for (int i = 0; i < dataDecode.length; i++) {
        dataDecode[i]['photo'] = "assets/user_img/user$i.jpg";
      }
      List<User> result =
          dataDecode.map((user) => User.fromJson(user)).toList();
      return result;
    } catch (error) {
      throw Exception(error);
    }
  }
}
