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
  double _studyHoursPerDay = 0.0;
  double _studyHoursPerWeek = 0.0;
  List<String> _selectedStudyHabits =
      []; // Track multiple selected study habits

  final List<String> _studyHabits = [
    'Visual',
    'Auditory',
    'Writing',
    'Reading',
    'Taking Notes',
    'Group Study',
    'Using Flashcards',
    'Taking Notes During Lectures',
    'Watching Tutorial Videos',
    'Attending Study Groups',
    'Self-Paced Learning',
    'Using Mnemonics',
    'Practicing with Past Papers',
    'Explaining Concepts to Others',
    'Creating Mind Maps',
    'Setting Study Goals',
    'Reviewing Regularly',
    'Using Study Apps',
    'Active Recall',
    'Practice Testing',
    'Summarizing Information'
  ];

  // Adjusted to include a validation check for _selectedStudyHabits
  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      // Check if at least one study habit is selected
      if (_selectedStudyHabits.isNotEmpty) {
        _formKey.currentState!.save();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursesInputScreen(
              studyHoursPerDay: _studyHoursPerDay,
              studyHoursPerWeek: _studyHoursPerWeek,
            ),
          ),
        );
      } else {
        // Show a SnackBar if no study habit is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one study habit.')),
        );
      }
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Welcome Message
                Text(
                  'Welcome',
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

                // Grid for Multiple Study Habit Selection
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: _studyHabits.map((habit) {
                      final isSelected = _selectedStudyHabits.contains(habit);
                      return FilterChip(
                        label: Text(habit),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedStudyHabits.add(habit);
                            } else {
                              _selectedStudyHabits.remove(habit);
                            }
                          });
                        },
                        selectedColor: Colors.green,
                      );
                    }).toList(),
                  ),
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
      ),
    );
  }
}
