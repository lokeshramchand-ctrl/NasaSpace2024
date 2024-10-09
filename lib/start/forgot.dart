import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/start/loginpage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final usernameController = TextEditingController();
  String _message = ''; // For showing success or error messages

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    setState(() {
      _message = ''; // Reset message state before attempting password reset
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usernameController.text.trim());
      setState(() {
        _message = 'Password reset email sent! Check your inbox.';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Background gradient
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/22.jpg'), // Replace with your logo asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Main content
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo placeholder

                const SizedBox(height: 30),
                // "Welcome" text
                Text(
                  'Forgot Your Password!',
                  style: GoogleFonts.orbitron(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'No problemo!',
                  style: GoogleFonts.orbitron(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                // Email input field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "EMAIL",
                    style:
                        GoogleFonts.orbitron(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 46, 46, 52),
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 46, 46, 52),
                          spreadRadius: -4,
                          blurRadius: 5,
                        )
                      ]),
                  child: TextField(
                    controller: usernameController,
                    obscureText: true,
                    style: GoogleFonts.orbitron(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.orbitron(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(
                              232, 245, 245, 245), // Black border color
                          width: 3.0, // Thick black border width when enabled
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(232, 245, 245,
                              245), // Black border color when focused
                          width: 3.0, // Thick black border width when focused
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          spreadRadius: -4,
                          blurRadius: 5,
                        )
                      ]),
                  child: ElevatedButton(
                    onPressed: () {
                      passwordReset();
                    },
                    child: Text(
                      "RESET",
                      style: GoogleFonts.orbitron(
                          color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (_message.isNotEmpty)
                  Text(
                    _message,
                    style: GoogleFonts.orbitron(
                      color: _message.contains('sent')
                          ? Theme.of(context)
                              .colorScheme
                              .primary // Use primary color for success messages
                          : Colors.red, // Use error color for error messages
                    ),
                    textAlign: TextAlign.center,
                  ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Done with Reset?",
                      style: GoogleFonts.orbitron(
                          fontSize: 16, color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage()), // Replace with your RegisterPage widget
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.orbitron(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
