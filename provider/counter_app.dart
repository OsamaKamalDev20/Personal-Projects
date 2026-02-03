import 'package:firebase_projects/Technical%20Text/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF204E),
        title: Text("Counter App", style: TextStyle(fontWeight: .bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Text(
                "Current Count",
                style: TextStyle(fontSize: 40, fontWeight: .w600),
              ),
              Text(
                counter.count.toString(),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: .bold,
                  color: Color(0xFFFF204E),
                ),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => counter.increment(),
                    child: Icon(Icons.add_rounded, size: 80),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => counter.decrement(),
                    child: Icon(Icons.remove_rounded, size: 80),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
