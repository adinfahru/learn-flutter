import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<String> questions = [
    'What is the capital of France?',
    'Which planet is known as the Red Planet?',
  ];

  final List<List<String>> options = [
    ['Paris', 'London', 'Berlin', 'Rome'],
    ['Earth', 'Mars', 'Jupiter', 'Venus'],
  ];

  List<String> selectedAnswers = ['', ''];

  void _selectAnswer(int questionIndex, String answer) {
    setState(() {
      selectedAnswers[questionIndex] = answer;
    });
  }

  void _submitAnswers() {
    String result = '';
    for (int i = 0; i < questions.length; i++) {
      result +=
          'Q${i + 1}: ${questions[i]}\nYour answer: ${selectedAnswers[i]}\n\n';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Answers'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display both questions on the same page
            for (int i = 0; i < questions.length; i++) ...[
              Text(
                'Question ${i + 1}: ${questions[i]}',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Display options for each question
              for (String option in options[i])
                ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: selectedAnswers[i],
                    onChanged: (value) {
                      if (value != null) {
                        _selectAnswer(i, value);
                      }
                    },
                  ),
                ),
              const SizedBox(height: 2),
            ],
            // Button to submit answers
            Center(
              child: ElevatedButton(
                onPressed: _submitAnswers,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
