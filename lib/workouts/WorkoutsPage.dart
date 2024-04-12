import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/workouts/WorkoutDetailPage.dart';
import 'package:gym_appfin/workouts/WorkoutListTile.dart';
import 'package:gym_appfin/workouts/model.dart';

class WorkoutsPage extends StatefulWidget {
  final String? gender;
  final String ageGroup;
  final String level;

  WorkoutsPage({
    this.gender,
    required this.ageGroup,
    required this.level,
  });

  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<Workout> currentWorkoutList = [];
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    fetchExercises(widget.gender, widget.ageGroup, widget.level);
  }

  Future<void> fetchExercises(String? gender, String ageGroup, String level) async {
    final exercisesRef = databaseReference
        .child('workoutPlans')
        .child(gender ?? 'male') 
        .child(ageGroup)
        .child(level)
        .child('exercises');

    final snapshot = await exercisesRef.once();
    final exercisesData = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (exercisesData != null) {
      final exercises = exercisesData.entries.map((entry) {
        final exerciseData = entry.value as Map<dynamic, dynamic>;
        return Workout(
          name: exerciseData['name'],
          imageUrl: exerciseData['imageUrl'],
          sub: exerciseData['sub'],
          description: exerciseData['description'],
        );
      }).toList();

      setState(() {
        currentWorkoutList = exercises;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Workouts Page",
              style: TextStyle(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          ListView.builder(
            itemCount: currentWorkoutList.length,
            itemBuilder: (context, index) {
              final workout = currentWorkoutList[index];
              return WorkoutListTile(
                workout: workout,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailPage(
                      workouts: currentWorkoutList, 
                      currentIndex: index,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}