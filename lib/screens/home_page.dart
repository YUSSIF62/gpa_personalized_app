import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/course_inputScreen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _formKey = GlobalKey<FormState>();
  double _currentGPA = 0.0;
  double _goalGPA = 0.0;
  String _selectedStudyHabit = '';
  double _studyHoursPerDay = 0.0;
  double _studyHoursPerWeek = 0.0;

  final List<String> _studyHabits = [
    'Study regularly',
    'Last-minute cramming',
    'Group study',
    'Using flashcards',
    'Taking notes during lectures',
    'Watching tutorial videos',
    'Attending study groups',
    'Self-paced learning'
  ];

  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CoursesInputScreen(
                  studyHoursPerDay: _studyHoursPerDay,
                  studyHoursPerWeek: _studyHoursPerWeek,
                )),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Welcome Message
              Text(
                'Welcome, Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Let's plan your ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'CGPAgoal',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Input for Current CGPA
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your current CGPA',
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
                    return 'Please enter your current CGPA';
                  }
                  return null;
                },
                onSaved: (value) => _currentGPA = double.parse(value!),
              ),
              SizedBox(height: 15),

              // Input for Targeted CGPA
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your Targeted CGPA',
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
                    return 'Please enter your targeted CGPA';
                  }
                  return null;
                },
                onSaved: (value) => _goalGPA = double.parse(value!),
              ),
              SizedBox(height: 15),

              // Dropdown for Study Habits
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select study habits',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedStudyHabit.isEmpty ? null : _selectedStudyHabit,
                items: _studyHabits.map((String habit) {
                  return DropdownMenuItem<String>(
                    value: habit,
                    child: Text(habit),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStudyHabit = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a study habit';
                  }
                  return null;
                },
                onSaved: (value) {
                  _selectedStudyHabit = value!;
                },
              ),
              SizedBox(height: 15),

              // Input for Study Hours Per Week
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Study Hours Per Week',
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
                    return 'Please enter your study hours per week';
                  }
                  return null;
                },
                onSaved: (value) => _studyHoursPerWeek = double.parse(value!),
              ),

              SizedBox(height: 30),

              // Next Button
              ElevatedButton(
                onPressed: _submitDetails,
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
