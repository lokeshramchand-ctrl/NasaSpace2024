// ignore_for_file: library_private_types_in_public_api, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/start/loginpage.dart';
import 'package:nasa/start/registerpage.dart';
import 'package:video_player/video_player.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    _controller = VideoPlayerController.asset("assets/space.mp4")
      ..initialize().then((_) {
        // Ensure the video is looping
        _controller.setLooping(true);
        // Play the video as soon as it's initialized
        _controller.play();
        // Rebuild the widget once the video is loaded
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Dispose of the video controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video background
          _controller.value.isInitialized
              ? Positioned.fill(
                  // Fill the entire screen
                  child: VideoPlayer(_controller),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          // Add the image on top of the video
          Center(
            child: Image.asset(
              "assets/35.png", // Update this path to your image
              width: 200, // You can adjust the size as needed
              height: 200,
            ),
          ),
          // Your content goes here, over the video
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Add some space below the video
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Update the text to be more playful and kid-friendly
                    Text(
                      "Ready to Explore?\nJoin the Cosmic Adventure!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.balooTamma2(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          const Shadow(
                            color: Colors.white,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50), // Add some spacing

                    // Sign Up Button
                    TextButton(
                      onPressed: () {
                        // Handle Sign Up button press
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Registerpage(), // Replace HomePage with your destination
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black, // Modern black theme
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.balooTamma2(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Add spacing between buttons

                    // Log In Button
                    TextButton(
                      onPressed: () {
                        // Handle Log In button press
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginPage(), // Replace HomePage with your destination
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white, // Modern white theme
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Log In",
                        style: GoogleFonts.balooTamma2(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add space at the bottom
            ],
          ),
        ],
      ),
    );
  }
}
