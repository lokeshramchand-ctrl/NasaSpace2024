import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Background image for the entire screen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/22.jpg'), // Replace with your logo asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content with scrollable containers
          SingleChildScrollView(
            child: Column(
              children: [
                // First Container
                Container(
                  width: double.infinity, // Full width
                  height: 200, // Height of the container
                  margin: const EdgeInsets.symmetric(
                      vertical: 10), // Vertical spacing between containers
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Curved corners
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/36.jpg'), // Corrected image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment
                        .bottomLeft, // Aligns text to the bottom left
                    padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 20), // Padding to keep it away from the edge
                    child: Text(
                      'Red Spider Nebula',
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Second Container
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Curved corners
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/37.jpg'), // Corrected image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment
                        .bottomLeft, // Aligns text to the bottom left
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Ring Nebula',
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Third Container
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/38.jpg'), // Replace with your next image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment
                        .bottomLeft, // Aligns text to the bottom left
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Bubble Nebula',
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
