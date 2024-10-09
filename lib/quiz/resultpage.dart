import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      backgroundColor: Colors.white, // Set a background color if needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can customize the content below as needed
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/25.jpg'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Lottie paper animation in the background
            Container(
              child: Lottie.asset(
                "assets/paper.json", // Paper animation
                repeat: true,
                width: 300,
                height: 300,
              ),
            ),

            // Lottie trophy animation on top
            Container(
              child: Lottie.asset(
                "assets/trophy.json", // Trophy animation
                repeat: true,
                width:
                    200, // Adjust the size so that it appears slightly smaller
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '$score/$totalQuestions',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.amber, // Change color if needed
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Go back to the quiz
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Back to Quiz'),
            ),
          ],
        ),
      ),
    );
  */
    return Scaffold(
      body: Stack(
        children: [
          // Background and animations
          buildBackgroundAndAnimations(),

          // Text display
          buildTextSection(context),
        ],
      ),
    );
  }

  // Separate method for background image and animations
  Widget buildBackgroundAndAnimations() {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/25.jpg'), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Lottie paper animation in the background
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Lottie.asset(
            "assets/paper.json", // Paper animation
            repeat: true,
            width: 300,
            height: 300,
          ),
        ),

        // Lottie trophy animation on top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Lottie.asset(
            "assets/trophy.json", // Trophy animation
            repeat: true,
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }

  // Separate method for the text display section
  Widget buildTextSection(context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Space between text and button
      children: [
        // Expanded section for the text in the middle
        Expanded(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers the column in the middle
            children: [
              const SizedBox(height: 60),
              Align(
                // Congratulations text
                alignment: Alignment.center,
                child: Text(
                  "Congratulations!!",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Spacer between text elements

              // "You Won" text
              Text(
                "You Won",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),

              Text(
                "POINTS EARNED",
                style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
              ),
              // Score text
              Text(
                '$score/$totalQuestions',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber, // Change color if needed
                ),
              ),
            ],
          ),
        ),

        // Button at the bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 30.0), // Add some padding from the bottom
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Go back to the quiz
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: Text(
                'Play Again',
                style: GoogleFonts.poppins(color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
