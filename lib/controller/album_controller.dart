import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_apps/config/constant.dart';
import 'package:user_apps/model/album.dart';
import 'package:user_apps/model/photo.dart';

class AlbumController {
  Future<List<Album>> getAlbum(int userId) async {
    Uri url = Uri.parse(
      "${ApiConstant.baseUrl}${ApiConstant.albumEndpoint}?userId=$userId",
    );
    print(url);

    Response response = await http.get(url);
    List data = jsonDecode(response.body);

    List<Album> result = data.map((e) => Album.fromJson(e)).toList();
    return result;
  }

  Future<List<Photo>> getPhotos(int albumId) async {
    Uri url = Uri.parse(
      "${ApiConstant.baseUrl}${ApiConstant.photoEndpoint}?albumId=$albumId",
    );
    print(url);

    Response response = await http.get(url);
    List data = jsonDecode(response.body);
    print(response.body);

    List<Photo> result = data.map((e) => Photo.fromJson(e)).toList();
    return result;
  }
}
