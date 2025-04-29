import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual desses jogadores NÃO faz parte do elenco atual da FURIA?',
      'options': ['FalleN', 'yuurih', 'fer', 'KSCERATO'],
      'answer': 'fer'
    },
    {
      'question': 'Em que ano a FURIA foi fundada?',
      'options': ['2015', '2017', '2019', '2020'],
      'answer': '2017'
    },
    {
      'question': 'Qual desses campeonatos a FURIA já venceu?',
      'options': ['IEM Cologne', 'ESL Challenger Anaheim', 'PGL Major Antwerp', 'BLAST Premier'],
      'answer': 'ESL Challenger Anaheim'
    },
    {
      'question': 'Quem é o AWPer do time atual da FURIA?',
      'options': ['arT', 'molodoy', 'FalleN', 'yuurih'],
      'answer': 'molodoy'
    },
    {
      'question': 'Qual mapa é tradicionalmente forte para a FURIA?',
      'options': ['Dust2', 'Mirage', 'Nuke', 'Inferno'],
      'answer': 'Mirage'
    }
  ];

  int _currentQuestion = 0;
  int _score = 0;
  bool _answered = false;
  String? _selectedOption;

  void _selectAnswer(String option) {
    if (_answered) return;

    setState(() {
      _selectedOption = option;
      _answered = true;
      if (option == _questions[_currentQuestion]['answer']) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentQuestion < _questions.length - 1) {
        setState(() {
          _currentQuestion++;
          _answered = false;
          _selectedOption = null;
        });
      } else {
        _showFinalScore();
      }
    });
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Fim do Quiz!'),
        content: Text('Você acertou $_score de ${_questions.length} perguntas!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentQuestion = 0;
                _score = 0;
                _answered = false;
                _selectedOption = null;
              });
            },
            child: const Text('Recomeçar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz da FURIA')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pergunta ${_currentQuestion + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              question['question'],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...question['options'].map<Widget>((option) {
              final isSelected = option == _selectedOption;
              final isCorrect = option == question['answer'];
              Color color = Colors.white;
              if (_answered) {
                color = isCorrect
                    ? Colors.green
                    : (isSelected ? Colors.red : Colors.white70);
              }
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: 1.0,
                child: Card(
                    color: _answered
                        ? (isCorrect ? Colors.green.withOpacity(0.3) : (isSelected ? Colors.red.withOpacity(0.3) : Colors.black12))
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                title: Text(option, style: TextStyle(color: color)),
                onTap: () => _selectAnswer(option),
              ),),);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
