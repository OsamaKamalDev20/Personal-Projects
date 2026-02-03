import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIntegrationServices extends StatefulWidget {
  const ApiIntegrationServices({super.key});

  @override
  State<ApiIntegrationServices> createState() => _ApiIntegrationServicesState();
}

class _ApiIntegrationServicesState extends State<ApiIntegrationServices> {
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load users. Status Code: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF033FFF),
        title: Text(
          "API Integration",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF033FFF)),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: .center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            final users = snapshot.data ?? [];

            if (users.isEmpty) {
              return const Center(
                child: Text(
                  "No users found",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            }

            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, _) => const SizedBox(),
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const .symmetric(horizontal: 15, vertical: 10),
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF033FFF),
                      child: Text(
                        user["id"].toString(),
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(
                      user["name"],
                      style: TextStyle(fontWeight: .w600),
                    ),
                    subtitle: Text(
                      user["email"],
                      style: TextStyle(
                        fontWeight: .w400,
                        color: Color(0xFF033FFF),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
