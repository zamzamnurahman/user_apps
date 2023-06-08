import 'package:flutter/material.dart';
import 'package:user_apps/controller/user_controller.dart';
import 'package:user_apps/model/user.dart';
import 'package:user_apps/views/main_screen.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("Choose your user"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder(
          future: UserController().getUserData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    User user = snapshot.data![index];
                    return userCard(context, user);
                  });
            }
          },
        ),
      ),
    );
  }

  InkWell userCard(BuildContext context, User user) {
    return InkWell(
        onTap: () {
          // user.post?[0];
          dialogUserChoosed(context, user);
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(user.photo!))),
          child: Text(user.name!,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 10.0,
                    )
                  ])),
        ));
  }

  Future<dynamic> dialogUserChoosed(BuildContext context, User user) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Your User ?"),
              content: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(5),
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(user.photo!))),
                child: Text(user.name!,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 10.0,
                          )
                        ])),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => MainScreen(
                                  user: user,
                                )),
                        (route) => false);
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }
}
