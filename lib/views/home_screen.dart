import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_apps/controller/post_controll.dart';
import 'package:user_apps/model/post.dart';

import '../controller/user_controller.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2), () {
          // PostController().getPostData();
          setState(() {});
        });
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("User Post"),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh)),
            ),
            FutureBuilder(
              future: PostController().getPostData(),
              builder: (_, postData) {
                if (postData.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Column(
                    children: List.generate(postData.data!.length, (index) {
                      Post post = postData.data![index];
                      int userId = post.userId!;
                      return FutureBuilder(
                          future: UserController().getUserDataById(userId),
                          builder: (_, userData) {
                            if (userData.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 100,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ));
                            }
                            User user = userData.data!;
                            return Card(
                                margin: const EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage(user.photo!),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("@${user.username}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text("- ${post.title}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text('"${post.body}"')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          });
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
