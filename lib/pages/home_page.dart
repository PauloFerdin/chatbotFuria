import 'package:chatbotfuria/pages/quiz_page.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'furiaLogo',
                child: Container(
                  height: 140,
                  child: Image.asset(
                    'assets/images/Furia_Esports_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'BEM-VINDO AO CHAT OFICIAL DA TORCIDA FURIA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Fique por dentro dos próximos jogos, jogadores e curiosidades do time que você ama! 🦁💛',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'BATER UM PAPO COM A FURIA',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                child: const Text('DESAFIAR SEUS CONHECIMENTOS 🔥'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}