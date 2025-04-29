import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/chat_page.dart';
import 'dart:async';

void main() {
  runApp(const FuriaApp());
}

class FuriaApp extends StatelessWidget {
  const FuriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FURIA Chat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepPurple,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFD700),
            foregroundColor: Colors.black,
            shadowColor: Colors.amber,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}

