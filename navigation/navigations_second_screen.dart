import 'package:flutter/material.dart';

class NavigationsSecondScreen extends StatelessWidget {
  final String message2;
  const NavigationsSecondScreen({super.key, required this.message2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8C43A),
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
          child: Column(
            spacing: 15,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Text("🎉🏆", style: TextStyle(fontSize: 80)),
              Text(
                "$message2 Your are selected as a Junior Flutter Developer at Vative Apps",
                textAlign: .center,
                style: TextStyle(fontSize: 20, fontWeight: .w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
