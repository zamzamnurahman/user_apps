import 'package:flutter/material.dart';
import 'package:user_apps/extension/format_address.dart';

import '../model/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(user.photo!),
                )),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  title: Text("@${user.username}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(user.name!,
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                )),
            Card(
              child: ListTile(
                title: const Text("Email"),
                subtitle: Text(user.email!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Address"),
                subtitle: Text(user.address!.formatedAdress(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Company"),
                subtitle: Text(user.company!.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Website"),
                subtitle: Text(user.website!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text("Log out"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
