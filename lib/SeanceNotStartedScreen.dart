import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class SeanceNotStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Séance en attente"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "La séance n'a pas commencé",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
