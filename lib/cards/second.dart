// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    _controller = VideoPlayerController.asset("assets/rocket1.mp4")
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
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5), // Translucent effect
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.cyanAccent),
          onPressed: () {
            // Trigger the full-screen menu
            showFullScreenMenu(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Video background
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      // Set the fit to BoxFit.cover to fill the screen while maintaining aspect ratio
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
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
                    // Your content here
                    Text(
                      "Let's explore the Exoplanets",
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 32,
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
                    TextButton(
                      onPressed: () {
                        // Handle button press
                        print("Get started pressed");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Get started",
                        style: GoogleFonts.rajdhani(color: Colors.white),
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

// Function to show a full-screen menu from the left side
void showFullScreenMenu(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const FullScreenMenu(),
    ),
  );
}

class FullScreenMenu extends StatelessWidget {
  const FullScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9), // Full black background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0),
            child: Text(
              "Orbex",
              style: GoogleFonts.rajdhani(fontSize: 64, color: Colors.white),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _cyberpunkButton(context, "Topics", Colors.white),
                _cyberpunkButton(context, "Sol", Colors.white),
                _cyberpunkButton(context, "Exoplanets", Colors.white),
                _cyberpunkButton(context, "Wallpapers", Colors.white),
                _cyberpunkButton(context, "Ticket", Colors.white),
                _cyberpunkButton(context, "Quiz", Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Cyberpunk style button with glowing effect
  Widget _cyberpunkButton(BuildContext context, String text, Color neonColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        onPressed: () {
          // Handle button click
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.black),
          side: WidgetStateProperty.all(BorderSide(color: neonColor, width: 2)),
          overlayColor: WidgetStateProperty.all(neonColor.withOpacity(0.1)),
        ),
        child: Text(
          text,
          style: GoogleFonts.orbitron(
            color: neonColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: neonColor,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
