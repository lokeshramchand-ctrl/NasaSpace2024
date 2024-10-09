import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Rese extends StatefulWidget {
  final int score;
  final int totalQuestions;

  const Rese({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  State<Rese> createState() => _ReseState();
}

class _ReseState extends State<Rese> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background and animations
          buildBackgroundAndAnimations(),

          // Text display
          buildTextSection(),
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
                  AssetImage('assets/28.jpg'), // Replace with your image asset
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
  Widget buildTextSection() {
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
              const SizedBox(height: 120),
              Align(
                // Congratulations text
                alignment: Alignment.center,
                child: Text(
                  "Try Again",
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
                "You Lost",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 30), // Spacer between text elements
              Text(
                "POINTS EARNED",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.green,
                  decoration: TextDecoration.none,
                ),
              ),
              // Score text
              Text(
                '${widget.score}/${widget.totalQuestions}', // Corrected to use widget properties
                style: GoogleFonts.poppins(
                  fontSize: 26,
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
                style: GoogleFonts.poppins(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
