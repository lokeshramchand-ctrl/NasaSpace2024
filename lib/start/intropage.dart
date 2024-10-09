import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/start/auth_page.dart';
import 'package:nasa/start/button.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              "assets/22.jpg", // Replace with your image path
              fit: BoxFit
                  .cover, // Ensures the image covers the entire background
            ),
          ),

          // Content on top of the background
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Text(
                  "Exoplanets",
                  style: GoogleFonts.orbitron(
                    fontSize: 44,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Feel the Imagination",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    height: 2,
                  ),
                ),
                const Spacer(),
                IntroButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthPage()),
                    );
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
