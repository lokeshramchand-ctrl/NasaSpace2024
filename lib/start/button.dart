import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Callback for handling button press

  const IntroButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Making the button tappable
      borderRadius: BorderRadius.circular(
          10), // Ensuring ripple effect stays within the button's rounded shape
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(243, 140, 133, 132),
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.orbitron(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
