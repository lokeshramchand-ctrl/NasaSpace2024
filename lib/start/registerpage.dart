// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/start/loginpage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void register() async {
    // Show loading dialog
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    if (passwordController.text != confirmController.text) {
      Navigator.pop(context);
      displayMessage("Passwords do not match.", context);
      return; // Return to stop further execution
    }

    try {
      UserCredential usercred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usernameController.text,
              password: passwordController.text);

      Navigator.pop(context); // Close loading dialog
      displayMessage("Registration successful!", context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close loading dialog
      // Display more user-friendly error messages
      switch (e.code) {
        case 'email-already-in-use':
          displayMessage("The email address is already in use.", context);
          break;
        case 'invalid-email':
          displayMessage("The email address is invalid.", context);
          break;
        case 'weak-password':
          displayMessage("The password is too weak.", context);
          break;
        default:
          displayMessage("Registration failed: ${e.message}", context);
          break;
      }
    }
  }

  void displayMessage(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text("OK"),
                )
              ],
            ));
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
                    'Sign Up',
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
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "EMAIL",
                      style: GoogleFonts.orbitron(
                          fontSize: 12, color: Colors.white),
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
                      obscureText: false,
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
                  // Password input field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PASSWORD",
                      style: GoogleFonts.orbitron(
                          fontSize: 12, color: Colors.white),
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
                      controller: passwordController,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "CONFIRM PASSWORD",
                      style: GoogleFonts.orbitron(
                          fontSize: 12, color: Colors.white),
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
                      controller: confirmController,
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
                  const SizedBox(height: 30),
                  // Login button
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
                        register();
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.orbitron(
                            color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign-up prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: GoogleFonts.orbitron(
                            fontSize: 14, color: Colors.white70),
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
                            fontSize: 14,
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
      ),
    );
  }
}
