import 'package:firebase_projects/Technical%20Text/animations/animation_screen.dart';
import 'package:firebase_projects/Technical%20Text/navigation/navigations_first_screen.dart';
import 'package:firebase_projects/Technical%20Text/responsive/responsive_design.dart';
import 'package:flutter/material.dart';
import '../services/api_integration_services.dart';
import '../form/firebase_login.dart';
import '../form/forms.dart';
import '../pref/shared_preferences.dart';
import '../provider/counter_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final List<TasksItem> tasks = [
      TasksItem(title: "Task 1 - Counter (Provider)", screen: CounterApp()),
      TasksItem(title: "Task 2 - Form + Validation", screen: TextForm()),
      TasksItem(title: "Task 3 - Firebase Login", screen: FirebaseLogin()),
      TasksItem(
        title: "Task 4 - API Integrations",
        screen: ApiIntegrationServices(),
      ),
      TasksItem(title: "Task 5 - Local Storage", screen: LocalStorage()),
      TasksItem(
        title: "Task 6 - Navigation Args",
        screen: NavigationFirstScreen(),
      ),
      TasksItem(title: "Task 7 - Animation", screen: AnimationScreen()),
      TasksItem(title: "Task 8 - Responsive UI", screen: ResponsiveDesign()),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0065F8),
        title: Text(
          "Technical Test Preparation",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        padding: const .all(15),
        separatorBuilder: (_, _) => const SizedBox(height: 15),
        itemBuilder: (context, i) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: .circular(4)),
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              onTap: () => _navigateTo(context, tasks[i].screen),
              title: Text(tasks[i].title, style: TextStyle(fontWeight: .bold)),
            ),
          );
        },
      ),
    );
  }
}

class TasksItem {
  final String title;
  final Widget screen;

  TasksItem({required this.title, required this.screen});
}
