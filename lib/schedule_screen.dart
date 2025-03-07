import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'seances_screen.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text("Programme"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SectionTitle("Samedi"),
          CourseCard(courseName: "Algèbre"),
          CourseCard(courseName: "Programmation Orientée Objet"), // Linked to the new screen
          SectionTitle("Dimanche"),
          CourseCard(courseName: "Mathématiques Discrètes"),
          CourseCard(courseName: "Réseaux Informatiques"),
        ],
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;

  const CourseCard({required this.courseName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeancesScreen()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courseName, // ✅ Now dynamically displays course name
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Salle : 2220"),
              const Text("Séance : Cours/TD/TP"),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date : 02/03/2024"),
                  Text("Heure : 8 - 9:30"),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Niveau : Licence 2"),
                  Text("Section/Groupe : S: 3 / G: 1"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

