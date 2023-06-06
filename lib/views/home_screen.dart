import 'package:flutter/material.dart';
import 'package:user_apps/controller/user_controller.dart';

import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = UserController().user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Apps"),
        actions: [
          InkWell(
            onTap: () {
              print(user.name);
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(user.photo!),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: UserController().getUserData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 5);
                },
                itemBuilder: (_, index) {
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
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            print(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.co_present_outlined),
              label: "User",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }
}
