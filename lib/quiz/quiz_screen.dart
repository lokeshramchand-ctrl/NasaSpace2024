// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/quiz/questions.dart';
import 'package:nasa/quiz/quiz_data.dart';
import 'package:nasa/quiz/res.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> selectedQuestions; // Store selected questions
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _selectRandomQuestions();
  }

  void _selectRandomQuestions() {
    // Shuffle the original questions and select the first 10
    final random = Random();
    selectedQuestions = List<Question>.from(questions);
    selectedQuestions.shuffle(random); // Shuffle the questions
    selectedQuestions =
        selectedQuestions.take(10).toList(); // Take the first 10
  }

  void answerQuestion(String selectedOption) {
    if (selectedOption ==
        selectedQuestions[currentQuestionIndex].correctAnswer) {
      score++;
    }
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _navigateToResultPage();
    }
  }

  void _navigateToResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Score(score: score, totalQuestions: selectedQuestions.length),
      ),
    ).then((_) {
      setState(() {
        currentQuestionIndex = 0;
        score = 0;
        _selectRandomQuestions(); // Select new questions for the next session
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exoplanet Quiz'),
        backgroundColor:
            Colors.deepPurple, // Dark cyberpunk-inspired background
        centerTitle: true,
        titleTextStyle:
            GoogleFonts.orbitron(fontSize: 26, color: Colors.cyanAccent),
      ),
      body: Container(
        // Space & Cyberpunk background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.deepPurple, Colors.blueAccent],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure full width
          children: [
            // Futuristic planet/star icon at the top
            const Icon(
              Icons.rocket_launch_rounded,
              size: 60,
              color: Colors.purpleAccent,
              shadows: [
                Shadow(
                  blurRadius: 20,
                  color: Colors.blueAccent,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space before the question

            // Container for the question text
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    Colors.black87, // Dark background with a futuristic touch
                borderRadius: BorderRadius.circular(16.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.purpleAccent
                        .withOpacity(0.7), // Neon purple glow
                    offset: const Offset(0, 4),
                    blurRadius: 20, // Glowing effect
                  ),
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.7), // Neon blue glow
                    offset: const Offset(0, 8),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Text(
                selectedQuestions[currentQuestionIndex].questionText,
                textAlign: TextAlign.center, // Center the text
                style: GoogleFonts.orbitron(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30), // Space between question and options

            // Options as rectangular, neon-glowing buttons
            ...selectedQuestions[currentQuestionIndex].options.map((option) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 5.0), // Spacing between options
                child: ElevatedButton(
                  onPressed: () => answerQuestion(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Futuristic dark button
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12.0), // Rounded edges for cyber look
                    ),
                    shadowColor: Colors.blueAccent
                        .withOpacity(0.8), // Neon shadow effect
                    elevation: 15, // Floating button effect
                  ),
                  child: Text(
                    option,
                    style: GoogleFonts.orbitron(
                      fontSize: 16,
                      color: Colors.cyanAccent, // Neon cyan text
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
