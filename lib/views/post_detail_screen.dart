import 'package:flutter/material.dart';
import 'package:user_apps/controller/comment_controller.dart';
import 'package:user_apps/model/post.dart';
import 'package:user_apps/model/user.dart';

import '../model/comment.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(user.photo!),
              ),
              title: Text(user.username!),
              subtitle: Text(user.name!),
            ),
            const Divider(),
            ListTile(
              title: Text(
                post.title!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                ' "${post.body!}" ',
                textAlign: TextAlign.justify,
              ),
            ),
            const ListTile(
              title: Text("Comment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            FutureBuilder(
                future: CommentController().getCommentPost(post.id!),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: List.generate(snapshot.data!.length, (index) {
                        Comment comment = snapshot.data![index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: ListTile(
                            title: Text(comment.email!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Text(comment.name!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('"${comment.body!}"'),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
