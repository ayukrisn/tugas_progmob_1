import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/login_page.dart';
import 'package:tugas_progmob_1/signup_page.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 56),
                Image.asset(
                  'assets/logo.png',
                  height: 30,
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/to-do-list.png',
                  width: 300,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Text(
                          "Often getting overwhelmed with your unlimited task?",
                          style: GoogleFonts.baloo2(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF263E4A))),
                      const SizedBox(height: 16),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'No need to worry anymore! With ',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF263E4A)),
                            ),
                            TextSpan(
                              text: 'do it!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF263E4A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ', you can start doing your tasks with better flow and efficiency, ensuring you stay on top of your priorities and conquer your to-do list with ease.',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF263E4A)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: Text('Start Now!',
                            style: GoogleFonts.baloo2(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account? ',
                      style: TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF263E4A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
