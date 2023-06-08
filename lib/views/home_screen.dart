import 'package:flutter/material.dart';

import '../controller/user_controller.dart';
import '../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            title: Text("Home"),
          ),
          FutureBuilder(
            future: UserController().getUserData(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: List.generate(snapshot.data!.length, (index) {
                    User user = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(user.name![0]),
                        ),
                        title: Text("${user.name} @${user.username}"),
                        subtitle: Text("Email : ${user.email!}"),
                        trailing: Text(user.website!),
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
