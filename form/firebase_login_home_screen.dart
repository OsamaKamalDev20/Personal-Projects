// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLoginHomeScreen extends StatelessWidget {
  final String userEmail;
  const FirebaseLoginHomeScreen({super.key, required this.userEmail});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0060),
        title: Text(
          "Firebase Login Home Screen",
          style: TextStyle(fontWeight: .bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            spacing: 24,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Text(
                'Successfully Login',
                style: TextStyle(fontSize: 24, fontWeight: .w600),
              ),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: Color(0xFFFF0060),
                ),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  _logout(context);
                },
                icon: Icon(
                  Icons.logout_rounded,
                  size: 80,
                  color: Color(0xFFFF0060),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
