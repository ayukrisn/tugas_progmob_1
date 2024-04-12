import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/starting_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  delayScreen() async {
    var duration = Duration(seconds: 5);
    Timer(
      duration,
      () {
        try {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StartingPage(),
            ),
          );
        } catch (e) {
          print("Navigation Error: $e");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Your splash screen UI code
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 260,
            ),
            const SizedBox(height: 16),
            Text("Your to do list friend, ready to help!", style: GoogleFonts.baloo2(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF263E4A))),
          ],),)
    );
  }
}
