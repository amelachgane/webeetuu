import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';
import 'seances_screen.dart';
import 'SeanceNotStartedScreen.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<dynamic> schedule = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadSchedule();
  }

  Future<void> loadSchedule() async {
    try {
      // Retrieve stored teacher ID
      final prefs = await SharedPreferences.getInstance();
      String? teacherId = prefs.getString("teacherId");

      if (teacherId == null) {
        setState(() {
          errorMessage = "No teacher ID found. Please log in.";
          isLoading = false;
        });
        return;
      }

      // Fetch schedule using the stored teacherId
      List<dynamic> data = await ApiService.fetchSchedule();
      setState(() {
        schedule = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load schedule";
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bienvenue !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Aujourd’hui vous enseignez", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage != null
                ? Center(child: Text(errorMessage!, style: TextStyle(color: Colors.red)))
                : Expanded(
              child: ListView.builder(
                itemCount: schedule.length,
                itemBuilder: (context, index) {
                  var course = schedule[index];
                  return CourseCard(
                    courseName: course["title"], // Use actual API keys
                    date: course["date"],
                    time: course["time"],
                    location: course["place"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String date;
  final String time;
  final String location;

  const CourseCard({
    required this.courseName,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(courseName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Date: $date"),
            Text("Time: $time"),
            Text("Location: $location"),
          ],
        ),
      ),
    );
  }
}
