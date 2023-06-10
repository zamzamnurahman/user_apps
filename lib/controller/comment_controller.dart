import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/config/constant.dart';

import '../model/comment.dart';

class CommentController {
  Future<List<Comment>> getCommentPost(int postId) async {
    Uri url = Uri.parse(
      "${ApiConstant.baseUrl}${ApiConstant.commentEndpoint}?postId=$postId",
    );

    Response response = await http.get(url);
    List data = jsonDecode(response.body);

    List<Comment> result = data.map((e) => Comment.fromJson(e)).toList();
    return result;
  }
}
