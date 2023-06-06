import 'package:flutter/material.dart';
import 'package:user_apps/controller/user_controller.dart';
import 'package:user_apps/model/user.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? chooseUser;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Choose your user"),
      ),
      body: FutureBuilder(
        future: UserController().getUserData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      print(user.name);
                      chooseUser = user;
                    },
                    child: Card(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(user.photo!),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (UserController().user == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                content: Text("Please choose your user"),
              ),
            );
          } else {
            UserController().chooseUser = chooseUser!;
            Navigator.pushNamed(context, '/home');
          }
        },
        label: const Text("Choose User"),
      ),
    );
  }
}
