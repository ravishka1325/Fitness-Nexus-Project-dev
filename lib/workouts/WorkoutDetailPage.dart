import 'package:flutter/material.dart';
import 'package:gym_appfin/workouts/model.dart';
import 'package:gym_appfin/screens/home.dart';
import 'dart:io';


class WorkoutDetailPage extends StatefulWidget {
  final List<Workout> workouts;
  final int currentIndex;

  WorkoutDetailPage({required this.workouts, required this.currentIndex});

  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    final workout = widget.workouts[widget.currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(workout.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container( 
          color: Colors.black, 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: workout.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      workout.imageUrl,
                      width: double.infinity,
                      height: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  workout.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                  textAlign: TextAlign.center, 
                ),
                const SizedBox(height: 16.0),
                _buildNextButton(context), 
                Container(
                  child: SizedBox(height: 150,
                  
                  ),
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _buildNextButton(BuildContext context) {
  final isLastWorkout = widget.currentIndex == widget.workouts.length - 1;

  return Align(
    alignment: Alignment.bottomCenter,
    child: ElevatedButton.icon(
      onPressed: () {
        if (isLastWorkout) {
          Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,
);
        } else {
          int nextIndex = widget.currentIndex + 1;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutDetailPage(
                workouts: widget.workouts,
                currentIndex: nextIndex,
              ),
            ),
          );
        }
      },
      icon: Icon(isLastWorkout ? Icons.home : Icons.navigate_next, color: Colors.white),
      label: Text(
        isLastWorkout ? 'Finish' : 'Next',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  );
}
}