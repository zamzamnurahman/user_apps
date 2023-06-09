import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/model/post.dart';

import '../config/constant.dart';

class PostController {
  Future<List<Post>> getPostData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);
      return result;
    } catch (error) {
      throw Exception(error);
    }
  }
