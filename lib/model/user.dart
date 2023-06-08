import 'package:user_apps/model/post.dart';

import 'address.dart';
import 'company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  String? photo;
  List<Post>? post;
  Company? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    photo = json['photo'];
    website = json['website'];
    // if (json['post'] != null) {
    //   post = <Post>[];
    //   json['post'].forEach((v) {
    //     post!.add(Post.fromJson(v));
    //   });
    // }
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }
}
