import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String? _gender;

  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      debugPrint("Name = ${_nameCtrl.text}");
      debugPrint("Email Address = ${_emailCtrl.text}");
      debugPrint("Age is = ${_ageCtrl.text}");
      debugPrint("Your Gender is = $_gender");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF4300FF),
          content: Text("Form is submitted successfully"),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4300FF),
        title: Text("Text Form App", style: TextStyle(fontWeight: .bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const .all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              children: [
                _customTextField(
                  controller: _nameCtrl,
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  hintText: "Enter Your name",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name required";
                    }
                    return null;
                  },
                ),
                _customTextField(
                  controller: _emailCtrl,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter Your email",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email required";
                    }
                    return null;
                  },
                ),
                _customTextField(
                  controller: _ageCtrl,
                  icon: Icons.numbers,
                  keyboardType: TextInputType.number,
                  hintText: "Enter Your Age",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Age is required';
                    }
                    final age = int.tryParse(value);
                    if (age == null || age <= 0) {
                      return "Please enter positive age";
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Enter Your Gender",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: .circular(6),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xFF4300FF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(6),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xFF4300FF),
                      ),
                    ),
                  ),

                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text("Male")),
                    DropdownMenuItem(value: 'Female', child: Text("Female")),
                    DropdownMenuItem(value: 'Other', child: Text("Other")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select your gender";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 60,
                  width: .infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4300FF),
                      foregroundColor: Colors.white,
                    ),

                    onPressed: _submitForm,
                    child: Text(
                      "Submit Now",
                      style: TextStyle(fontWeight: .bold),
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
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: .circular(6),
          borderSide: BorderSide(width: 2, color: Color(0xFF4300FF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(6),
          borderSide: BorderSide(width: 2, color: Color(0xFF4300FF)),
        ),
        prefixIcon: Icon(icon, color: Color(0xFF4300FF)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54),
      ),
      validator: validator,
    );
  }
}
