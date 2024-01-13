
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MockInterviewScreen(),
    );
  }
}

class MockInterviewScreen extends StatefulWidget {
  const MockInterviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MockInterviewScreenState createState() => _MockInterviewScreenState();
}

class _MockInterviewScreenState extends State<MockInterviewScreen> {
  bool isTimerActive = false;
  int questionCount = 0;
  List<String> allQuestions = [
      "Tell me about yourself.",
    "Walk me through your resume.",
    "How did you hear about this position?",
    "Why do you want to work at this company?",
    "Why do you want this job?",
    "Why should we hire you?",
    "What can you bring to the company?",
    "What are your greatest strengths?",
    "What do you consider to be your weaknesses?",
    "What is your greatest professional achievement?",
    "Tell me about a challenge or conflict you’ve faced at work, and how you dealt with it.",
    "Tell me about a time you demonstrated leadership skills.",
    "What’s a time you disagreed with a decision that was made at work?",
    "Tell me about a time you made a mistake.",
    "Tell me about a time you failed.",
    "Why are you leaving your current job?",
    "Why were you fired?",
    "Why was there a gap in your employment?",
    "Can you explain why you changed career paths?",
    "What’s your current salary?",
    "What do you like least about your job?",
    "What are you looking for in a new position?",
    "What type of work environment do you prefer?",
    "What’s your work style?",
    "What’s your management style?",
    "How would your boss and coworkers describe you?",
    "How do you deal with pressure or stressful situations?",
    "What do you like to do outside of work?",
    "Are you planning on having children?",
    "How do you stay organized?",
    "How do you prioritize your work?",
    "What are you passionate about?",
    "What motivates you?",
    "What are your pet peeves?",
    "How do you like to be managed?",
    "Do you consider yourself successful?",
    "Where do you see yourself in five years?",
    "How do you plan to achieve your career goals?",
    "What are your career aspirations?",
    "What’s your dream job?",
    "What other companies are you interviewing with?",
    "What makes you unique?",
    "What should I know that’s not on your resume?",
    "What would your first few months look like in this role?",
    "What are your salary expectations?",
    "What do you think we could do better or differently?",
    "When can you start?",
    "Are you willing to relocate?"
    
  ];

  List<String> currentQuestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue],
            ),
          ),
        ),
        title: const Text('Mock Interview App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startInterview,
              child: const Text('Start Interview'),
            ),
            const SizedBox(height: 20),
            Text(
              'Questions answered: $questionCount',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue, 
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Time per question: N/A',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.green, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startInterview() {
    setState(() {
      questionCount = 0;
      currentQuestions = _getRandomQuestions();
     
    });

    //start interview
    _askQuestion();
  }

  void _askQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            //reset app state when background is clicked
           
            Navigator.of(context).pop();
            startInterview();
          },
          child: AlertDialog(
            title: Text('Question ${questionCount + 1}'),
            content: Text(currentQuestions[questionCount]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _nextQuestion();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _nextQuestion() {
    setState(() {
      questionCount++;
    });

    //check for more questions
    if (questionCount < currentQuestions.length) {
      _askQuestion();
    } else {
      //end of interview
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Interview Over'),
            content: const Text('You have answered all questions.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  startInterview();
                },
                child: const Text('Retry'),
              ),
            ],
          );
        },
      );
    }
  }

  List<String> _getRandomQuestions() {
    List<String> randomQuestions = [];
    List<String> allQuestionsCopy = List.from(allQuestions);
    final random = Random();

    for (int i = 0; i < 15; i++) {
      int randomIndex = random.nextInt(allQuestionsCopy.length);
      randomQuestions.add(allQuestionsCopy[randomIndex]);
      allQuestionsCopy.removeAt(randomIndex);
    }

    return randomQuestions;
  }
}
