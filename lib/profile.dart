import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF4F9),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: const Color(0xFFB6DCFF),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const ProfileOption(icon: Icons.person, text: 'Account'),
          const ProfileOption(icon: Icons.settings, text: 'Settings'),
          const ProfileOption(icon: Icons.star_border, text: 'Help & Support'),
          const ProfileOption(icon: Icons.notifications, text: 'Notifications'),
        ],
      ),

    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileOption({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(text, style: const TextStyle(fontSize: 16)),
          trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ),
      ),
    );
  }
}
