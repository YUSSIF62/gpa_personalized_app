import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/pledge_screen.dart';

class CoursesInputScreen extends StatefulWidget {
  final double studyHoursPerDay;
  final double studyHoursPerWeek;

  CoursesInputScreen(
      {required this.studyHoursPerDay, required this.studyHoursPerWeek});

  @override
  _CoursesInputScreenState createState() => _CoursesInputScreenState();
}

class _CoursesInputScreenState extends State<CoursesInputScreen> {
  final _formKey = GlobalKey<FormState>();
  String _courseName = '';
  double _creditHours = 0.0;

  List<Map<String, dynamic>> _courses = [];

  void _addCourse() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _courses.add({'name': _courseName, 'credits': _creditHours});
        _courseName = '';
        _creditHours = 0.0;
        _formKey.currentState!.reset();
      });
    }
  }

  double get _totalCredits {
    return _courses.fold(0.0, (total, course) => total + course['credits']);
  }

  void _goToPledgeScreen() {
    if (_courses.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PledgeScreen(
                courses: _courses,
                studyHoursPerDay: widget.studyHoursPerDay,
                studyHoursPerWeek: widget.studyHoursPerWeek)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add at least one course')),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              'Enter your semester courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Input for Course Name
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Course Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a course name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _courseName = value!;
                    },
                  ),
                  SizedBox(height: 15),

                  // Input for Credit Hours
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Credit hours',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the credit hours';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _creditHours = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 20),

                  // Add Course Button
                  ElevatedButton(
                    onPressed: _addCourse,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Add Courses',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Course List (if available)
            Expanded(
              child: _courses.isEmpty
                  ? Center(child: Text('No courses added yet.'))
                  : ListView.builder(
                      itemCount: _courses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_courses[index]['name']),
                          subtitle: Text(
                              '${_courses[index]['credits']} credit hours'),
                        );
                      },
                    ),
            ),

            // Total Courses and Credits
            SizedBox(height: 10),
            Text(
              'Total Courses: ${_courses.length}, Total Credits: $_totalCredits',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
    );
  }
}
