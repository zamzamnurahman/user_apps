import 'package:flutter/material.dart';
import 'package:user_apps/views/choose_user_screen.dart';
import 'package:user_apps/views/main_screen.dart';
import 'package:user_apps/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/choose-user": (context) => const ChooseUserScreen(),
        "/main": (context) => const MainScreen(),
      },
    );
  }
}
