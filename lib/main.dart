import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Goal Achiever',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageScreen()),
      );
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GPA Goal Achiever',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: _navigateToSignUp,
                child: Text('Don’t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign-Up Screen
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page Screen
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
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set Your GPA Goal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Current GPA'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current GPA';
                    }
                    return null;
                  },
                  onSaved: (value) => _currentGPA = double.parse(value!),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'GPA Goal'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your GPA goal';
                    }
                    return null;
                  },
                  onSaved: (value) => _goalGPA = double.parse(value!),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Study Habits'),
                  value:
                      _selectedStudyHabit.isEmpty ? null : _selectedStudyHabit,
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
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Study Hours Per Day'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your average study hours per day';
                    }
                    return null;
                  },
                  onSaved: (value) => _studyHoursPerDay = double.parse(value!),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Study Hours Per Week'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your average study hours per week';
                    }
                    return null;
                  },
                  onSaved: (value) => _studyHoursPerWeek = double.parse(value!),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitDetails,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Courses Input Screen
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
      appBar: AppBar(title: Text('Enter Your Courses')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Course Name'),
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
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Credit Hours'),
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
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addCourse,
                    child: Text('Add Course'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 10),
            Text(
              'Total Courses: ${_courses.length}, Total Credits: $_totalCredits',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToPledgeScreen,
              child: Text('Proceed to Pledge'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pledge Screen
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
      appBar: AppBar(title: Text('Promise/Pledge')),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _goToStudyPlanScreen(context);
              },
              child: Text('I Agree'),
            ),
          ],
        ),
      ),
    );
  }
}

// Study Plan Screen
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
      {'start': '11:00 AM', 'end': '1:00 PM'},
      {'start': '2:00 PM', 'end': '4:00 PM'},
      {'start': '4:00 PM', 'end': '6:00 PM'},
      {'start': '7:00 PM', 'end': '9:00 PM'}
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
      appBar: AppBar(title: Text('Your Study Plan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Here is your personalized study plan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: studyPlan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${studyPlan[index]['day']} - ${studyPlan[index]['course']}'),
                    subtitle: Text('${studyPlan[index]['time']}'),
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
