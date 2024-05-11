import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animated_background.dart';  // Ensure this import is correct

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBackground(),  // This is your animated background
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Creativo',
                  style: GoogleFonts.sedgwickAveDisplay(  // Corrected the font here
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Ensure the text is visible on the background
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Generate any story you want',
                  style: GoogleFonts.notoSerif(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Ensure the text is visible on the background
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyChatPage()),
                    );
                  },
                  child: Text('Start Brainstorming'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    backgroundColor: Colors.white,  // Use backgroundColor instead of primary
                    foregroundColor: Colors.black,  // Use foregroundColor instead of onPrimary  // Text color of the button
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
