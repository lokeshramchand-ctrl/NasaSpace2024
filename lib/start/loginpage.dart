// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa/cards/second.dart';
import 'package:nasa/start/forgot.dart';
import 'package:nasa/start/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    // Show loading dialog while attempting to sign in
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Attempt to sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context); // Pop loading dialog after successful sign-in

      // Navigate to HomePage after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const Second(), // Replace HomePage with your destination
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Pop loading dialog on error

      // Handle specific authentication errors
      if (e.code == 'user-not-found') {
        showErrorDialog("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showErrorDialog("Wrong password provided.");
      } else {
        showErrorDialog("Something went wrong. Please try again.");
      }
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.notoSerif(
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient,
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
                    'Welcome Back!',
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
                  const SizedBox(height: 50),
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
                  // Email input field
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PASSWORD",
                      style: GoogleFonts.orbitron(
                          fontSize: 12, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Password input field
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
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            color: const Color.fromARGB(232, 245, 245,
                                245), // Black border color when focused
                            width: 2.0, // Thick black border width when focused
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Forgot password button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPassword()), // Replace with your RegisterPage widget
                        );
                        // Forgot password functionality
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.orbitron(color: Colors.white),
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
                        signUserIn();
                      },
                      child: Text(
                        "Login",
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
                        "Don't have account?",
                        style: GoogleFonts.orbitron(
                            fontSize: 16, color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Registerpage()), // Replace with your RegisterPage widget
                          );
                        },
                        child: Text(
                          'Sign Up',
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
