import 'package:flutter/material.dart';
import 'package:user_apps/model/post.dart';
import 'package:user_apps/model/user.dart';

class PostDetailScreen extends StatelessWidget {
  final User user;
  final Post post;
  const PostDetailScreen({
    super.key,
    required this.user,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Post"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.photo!),
            ),
            title: Text(user.username!),
            subtitle: Text(user.name!),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              post.title!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(' "${post.body!}" '),
          )
        ],
      ),
    );
  }
}
