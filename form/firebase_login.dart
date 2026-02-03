// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/Technical%20Text/form/firebase_login_home_screen.dart';
import 'package:flutter/material.dart';

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({super.key});

  @override
  State<FirebaseLogin> createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Successfully Login'),
        ),
      );

      final email = userCredential.user?.email ?? '';

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FirebaseLoginHomeScreen(userEmail: email),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Login failed'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0060),
        title: Text(
          "Firebase Login",
          style: TextStyle(fontWeight: .bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                _customTextField(
                  controller: emailController,
                  icon: Icons.email_rounded,
                  hintText: "Enter your email",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email required";
                    }
                    return null;
                  },
                ),
                _customTextField(
                  controller: passwordController,
                  icon: Icons.lock_rounded,
                  hintText: "Enter your password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 60,
                  width: .infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF0060),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: isLoading ? null : _login,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Login",
                            style: TextStyle(fontWeight: .bold, fontSize: 18),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: .circular(6),
          borderSide: BorderSide(width: 2, color: Color(0xFFFF0060)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(6),
          borderSide: BorderSide(width: 2, color: Color(0xFFFF0060)),
        ),
        prefixIcon: Icon(icon, color: Color(0xFFFF0060)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54),
      ),
      validator: validator,
    );
  }
}
