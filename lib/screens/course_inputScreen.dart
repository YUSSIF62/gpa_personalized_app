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
  final List<String> _years = [
    'Level 100',
    'Level 200',
    'Level 300',
    'Level 400'
  ];
  final List<String> _semesters = ['First Semester', 'Second Semester'];

  // Method to add course details
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Please complete all fields and add at least one course')),
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
                  labelText: 'Select your University Year',
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

              // Form for Adding Course Name and Credit Hours
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Input for Course Name
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Course Name',
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
                        labelText: 'Credit Hours',
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
                        'Add Course',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Course List (if available)
              _courses.isEmpty
                  ? Center(child: Text('No courses added yet.'))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _courses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_courses[index]['name']),
                          subtitle: Text(
                              '${_courses[index]['credits']} credit hours'),
                        );
                      },
                    ),

              // Total Courses and Credits
              SizedBox(height: 20),
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
      ),
    );
  }
}
