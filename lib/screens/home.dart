import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/main.dart';
import 'package:gym_appfin/workouts/WorkoutsPage.dart';
import 'package:gym_appfin/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _username;
  int selectedIndex=0;
  File? _profileImage; 
  double? _userWeight;
  int? _userAge;
  int? _userHeight;
  String? _userGender;
  String? _profileImageUrl;

  


  @override
  void initState() {
    super.initState();
    _getUserName();
    _getUserData();
  }

Future<void> _getUserData() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    setState(() {
      _userWeight = userDoc.data()?['weight'];
      _userAge = userDoc.data()?['age'];
      _userHeight = userDoc.data()?['height'];
      _userGender = userDoc.data()?['gender'];
       _profileImageUrl = userDoc.data()?['profileImageUrl'];
    });
  }
}

Future<void> _getUserName() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userDoc = await FirebaseFirestore.instance
        .collection('students')
        .doc(user.uid)
        .get();
    setState(() {
      _username = userDoc.data()?['username'];
    });
  }
}
void _updateUserWeight(double newWeight) {
  setState(() {
    _userWeight = newWeight;
  });
}

  double _calculateBMI() {
  if (_userWeight != null && _userHeight != null) {
    final heightInMeters = _userHeight! / 100; 
    final bmi = _userWeight! / (heightInMeters * heightInMeters);
    return bmi;
  } else {
    return 0.0; 
  }
}
String _getBMIStatus(double bmi) {
  if (bmi < 16) {
    return 'Severely Underweight';
  } else if (bmi >= 16 && bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Healthy weight';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}
String _getTargetLevel(String bmiStatus) {
  switch (bmiStatus) {
    case 'Healthy weight':
       return 'Maintain Shape';
    case 'Overweight':
    case 'Obese':
return 'Loose Weight';
    case 'Underweight':
    case 'Severely Underweight':
      return 'Weight Gain';
    default:
      return 'N/A';
  }
}
double _getBMIRecommendation(String bmiStatus) {
  final healthyWeight = 'Healthy weight';
  final underweight = ['Underweight', 'Severely Underweight'];
  final overweight = ['Overweight', 'Obese'];
  final targetBMI = 22.0;

  if (bmiStatus == healthyWeight) {
    return 0.0; 
  } else if (underweight.contains(bmiStatus)) {
    final targetWeight = _calculateTargetWeight(targetBMI);
    return targetWeight - (_userWeight ?? 0);
  } else if (overweight.contains(bmiStatus)) {
    final targetWeight = _calculateTargetWeight(targetBMI);
    return (_userWeight ?? 0) - targetWeight;
  } else {
    return 0.0;
  }
}
double _calculateTargetWeight(double targetBMI) {
  if (_userHeight != null) {
    final heightInMeters = _userHeight! / 100.0; 
    return targetBMI * pow(heightInMeters, 2); 
  } else {
    return 0.0;
  }
}

void _navigateToWorkoutsPage(String level, String ageGroup) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WorkoutsPage(
        gender: _userGender ?? 'male', 
        ageGroup: ageGroup,
        level: level,
      ),
    ),
  );
}
 Widget _buildWorkoutPlan({
  required String label,
  required String duration,
  required String image,
  required String level,
}) {
  String ageGroup;
  if (_userAge != null) {
    if (_userAge! < 20) {
      ageGroup = 'below20';
    } else if (_userAge! < 40) {
      ageGroup = 'below40';
    } else {
      ageGroup = 'over40';
    }
  } else {
    ageGroup = 'below20'; 
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToWorkoutsPage(level, ageGroup);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffff5722),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Start Workout',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

  @override
Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hello ${_username ?? 'User'},',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!)
                    : const AssetImage('assets/images/white.jpg') as ImageProvider,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(
                        label: 'Total time spent',
                        value: '0 hrs',
                      ),
                      _buildStatCard(
                        label: 'Weight status',
                        value: _userWeight != null && _userHeight != null
                            ? _getBMIStatus(_calculateBMI())
                            : 'N/A',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(
                        label: 'Target levels',
                        value: _userWeight != null && _userHeight != null
                            ? _getTargetLevel(_getBMIStatus(_calculateBMI()))
                            : 'N/A',
                      ),
                      _buildStatCard(
                        label: 'Gain/Loss for Goal',
                        value: _userWeight != null && _userHeight != null
                            ? _getBMIRecommendation(_getBMIStatus(_calculateBMI())).toStringAsFixed(2) + ' kg'
                            : 'N/A',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Select a Workout Plan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildWorkoutPlan(
              label: 'Beginner',
              duration: '20 min',
              image: 'assets/images/Hello.png',
              level: 'beginner',
            ),
            _buildWorkoutPlan(
              label: 'Intermediate',
              duration: '40 min',
              image: 'assets/images/second-img.jpg',
              level: 'intermediate',
            ),
            _buildWorkoutPlan(
              label: 'Advanced',
              duration: '60 min',
              image: 'assets/images/gymimg Large.png',
              level: 'advanced',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavBar(),
  );
}

  Widget _buildStatCard({required String label, required String value}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffff5722),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}