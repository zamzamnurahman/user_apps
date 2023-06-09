import 'package:flutter/material.dart';
import 'package:user_apps/views/home_screen.dart';
import 'package:user_apps/views/post_screen.dart';
import 'package:user_apps/views/profile_screen.dart';

import '../model/user.dart';

class MainScreen extends StatefulWidget {
  final User? user;
  const MainScreen({Key? key, this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Apps",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
          child: IndexedStack(
        index: _index,
        children: [
          const HomeScreen(),
          PostScreen(widget.user!),
          ProfileScreen(widget.user!)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_photo_alternate),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(widget.user!.photo!),
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}
