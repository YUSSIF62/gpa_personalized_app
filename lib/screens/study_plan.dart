import 'package:flutter/material.dart';

class StudyPlanScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  final double studyHoursPerDay;
  final double studyHoursPerWeek;

  StudyPlanScreen(
      {required this.courses,
      required this.studyHoursPerDay,
      required this.studyHoursPerWeek});

  // Function to generate a schedule with day and time slots
  List<Map<String, dynamic>> _generateStudyPlan() {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    List<Map<String, dynamic>> studyPlan = [];

    // Time slots for study (can be adjusted)
    List<Map<String, String>> timeSlots = [
      {'start': '9:00 AM', 'end': '11:00 AM'},
      {'start': '8:00 PM', 'end': '10:00 PM'},
    ];

    int timeSlotIndex = 0;
    int dayIndex = 0;

    for (int i = 0; i < courses.length; i++) {
      String courseName = courses[i]['name'];
      double creditHours = courses[i]['credits'];

      // Assigning course to multiple time slots across the week
      while (creditHours > 0) {
        studyPlan.add({
          'day': daysOfWeek[dayIndex],
          'course': courseName,
          'time':
              '${timeSlots[timeSlotIndex]['start']} - ${timeSlots[timeSlotIndex]['end']}'
        });

        // Move to the next time slot
        timeSlotIndex = (timeSlotIndex + 1) % timeSlots.length;

        // Move to the next day if time slots are exhausted for the day
        if (timeSlotIndex == 0) {
          dayIndex = (dayIndex + 1) % daysOfWeek.length;
        }

        // Reduce credit hours (Assume 2-hour time slots)
        creditHours -= 2;
      }
    }

    return studyPlan;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> studyPlan = _generateStudyPlan();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), // Replace with actual asset
            ),
            SizedBox(height: 10),

            // Title
            Text(
              'Schedule',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Schedule Table Header
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DAY',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'TIME',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Study Plan List in Table Format
            Expanded(
              child: ListView.builder(
                itemCount: studyPlan.length,
                itemBuilder: (context, index) {
                  return Container(
                    color:
                        index % 2 == 0 ? Colors.green[100] : Colors.green[200],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(studyPlan[index]['day']),
                        Text(studyPlan[index]['time']),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Add Course Button
            TextButton(
              onPressed: () {
                // Add Course Functionality
              },
              child: Text(
                'Add Course',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
