import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/study_plan.dart';

class PledgeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  final double studyHoursPerDay;
  final double studyHoursPerWeek;

  PledgeScreen(
      {required this.courses,
      required this.studyHoursPerDay,
      required this.studyHoursPerWeek});

  void _goToStudyPlanScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StudyPlanScreen(
              courses: courses,
              studyHoursPerDay: studyHoursPerDay,
              studyHoursPerWeek: studyHoursPerWeek)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promise/Pledge'),
        backgroundColor: Colors.green, // Make AppBar color consistent
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I, hereby pledge to adhere to the study plan recommended by the GPA Goal Achiever App in order to achieve my target GPA.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            // Styled "I Agree" button
            ElevatedButton(
              onPressed: () {
                _goToStudyPlanScreen(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Consistent green color
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 80), // Button size and padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
              ),
              child: Text(
                'I Agree',
                style: TextStyle(
                    fontSize: 16, color: Colors.white), // White text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
