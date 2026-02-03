import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModePreferences();
  }

  Future<void> _loadDarkModePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool("isDarkMode") ?? false;
    });
  }

  Future<void> _savePreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkMode", value);
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? Colors.grey[900]
            : const Color(0xFFCF0000),
        title: const Text(
          "Local Storage Shared Preferences",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(20),
          child: Column(
            spacing: 30,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                size: 80,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              Text(
                isDarkMode ? "Dark Mode" : "Light Mode",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: .bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SwitchListTile(
                title: Text(
                  isDarkMode ? "Dark Mode" : "Light Mode",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                ),
                value: isDarkMode,
                onChanged: _savePreferences,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
