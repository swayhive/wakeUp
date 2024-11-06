import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encouragement Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            letterSpacing: 1.1,
          ),
        ),
      ),
      home: const EncouragementHub(),
    );
  }
}

class EncouragementHub extends StatefulWidget {
  const EncouragementHub({super.key});

  @override
  State<EncouragementHub> createState() => _EncouragementHubState();
}

class _EncouragementHubState extends State<EncouragementHub> {
  final List<String> _encouragements = [
    "You are capable of amazing things!",
    "Every day is a new opportunity to grow.",
    "Your potential is limitless.",
    "You've got this!",
    "Small steps lead to big changes.",
    "Believe in yourself, as others believe in you.",
    "Today is full of possibilities.",
    "You are stronger than you know.",
    "Keep going, you're doing great!",
    "Your best is enough.",
  ];

  int _currentIndex = 0;

  void _showNextMessage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _encouragements.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          'Encouragement Hub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      _encouragements[_currentIndex],
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _showNextMessage,
                  icon: const Icon(Icons.favorite),
                  label: const Text('Next Message'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
