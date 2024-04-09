import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF446F84)),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Color(0xFF446F84)),
          textTheme: GoogleFonts.baloo2TextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 234, 185, 108), // Text style
            elevation: 1, // Elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
          )),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFCF3E5),
            labelStyle: const TextStyle(
              color: Color(0xFF446F84),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFFEFCD9F)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFF446F84)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFFeb4444)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFFeb4444)),
            ),
          )),
      home: SplashScreen(),
    );
  }
}
