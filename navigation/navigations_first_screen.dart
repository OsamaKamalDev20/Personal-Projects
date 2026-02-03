import 'package:firebase_projects/Technical%20Text/navigation/navigations_second_screen.dart';
import 'package:flutter/material.dart';

class NavigationFirstScreen extends StatelessWidget {
  const NavigationFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const message = "🏆 Congratulation 🎉";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD615),
        title: Text(
          "Navigations Arguments",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(20),
          child: Center(
            child: SizedBox(
              height: 55,
              width: .maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD615),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          NavigationsSecondScreen(message2: message),
                    ),
                  );
                },
                child: Text(
                  "Navigate to 2nd Screen",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
