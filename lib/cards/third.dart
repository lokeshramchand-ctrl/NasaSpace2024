import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image for the entire screen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/40.jpg'), // Replace with your logo asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Center the text in the middle of the screen
          const Center(
            child: Text(
              'AR coming soon',
              style: TextStyle(
                color: Colors.white, // White text color
                fontSize: 56, // Font size for larger text
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
