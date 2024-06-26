import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF5B95B)),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Color(0xFF263E4A)),
          textTheme: GoogleFonts.baloo2TextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFF5F5F5),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF5B95B),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
          )),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFF7F3EB),
            labelStyle: const TextStyle(
              color: Color(0xFF263E4A),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFFEFCD9F)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFF263E4A)),
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
