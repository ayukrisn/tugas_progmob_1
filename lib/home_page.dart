import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  int tasksLeft = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  // Wrap Row with Expanded
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align Column to start
                    children: [
                      const Text(
                        'Hello, Ayu Krisna!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You have $tasksLeft tasks left',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, size: 48, color: Color(0xFFF5B95B),)),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/avatar5.jpeg'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
