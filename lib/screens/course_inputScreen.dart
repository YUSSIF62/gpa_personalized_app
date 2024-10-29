import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/pledge_screen.dart';

class CoursesInputScreen extends StatefulWidget {
  final double studyHoursPerDay;
  final double studyHoursPerWeek;

  CoursesInputScreen({
    required this.studyHoursPerDay,
    required this.studyHoursPerWeek,
  });

  @override
  _CoursesInputScreenState createState() => _CoursesInputScreenState();
}

class _CoursesInputScreenState extends State<CoursesInputScreen> {
  final _formKey = GlobalKey<FormState>();
  String _courseName = '';
  double _creditHours = 0.0;
  String _selectedYear = ''; // To store the selected university year
  String _selectedSemester = ''; // To store the selected semester

  List<Map<String, dynamic>> _courses = [];

  // Dropdown options for Year and Semester
  final List<String> _years = ['100', '200', '300', '400'];
  final List<String> _semesters = ['First', 'Semester'];

  // Method to navigate to the Pledge Screen
  void _goToPledgeScreen() {
    if (_courses.isNotEmpty &&
        _selectedYear.isNotEmpty &&
        _selectedSemester.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PledgeScreen(
                courses: _courses,
                studyHoursPerDay: widget.studyHoursPerDay,
                studyHoursPerWeek: widget.studyHoursPerWeek)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                'Enter your Year and Semester Courses',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Dropdown for Selecting University Year
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select your Level/Year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedYear.isEmpty ? null : _selectedYear,
                items: _years.map((String year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your university year';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              // Dropdown for Selecting Semester
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select your Semester',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedSemester.isEmpty ? null : _selectedSemester,
                items: _semesters.map((String semester) {
                  return DropdownMenuItem<String>(
                    value: semester,
                    child: Text(semester),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSemester = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your semester';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Next Button
              ElevatedButton(
                onPressed: _goToPledgeScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
