import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class SeancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text("Séances"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 7, // Nombre de séances
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            margin: EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text("Séance ${index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text("Date : 02/03/2024"),
              onTap: () {
                // Ajoute ici une action si tu veux ouvrir une autre page
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Active l'icône calendrier
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // Retour à l'accueil
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
