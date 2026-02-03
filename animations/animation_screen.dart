import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final containerSize = _isExpanded ? 300.0 : 240.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00AD7C),
        title: Text(
          "Animated Container",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 30,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  color: _isExpanded ? Colors.redAccent : Colors.blueAccent,
                  borderRadius: .circular(6),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00AD7C),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                'Animate It',
                style: TextStyle(fontSize: 20, fontWeight: .w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
