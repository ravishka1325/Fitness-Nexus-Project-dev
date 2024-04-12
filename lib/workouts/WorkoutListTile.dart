import 'package:flutter/material.dart';
import 'package:gym_appfin/workouts/model.dart';


class WorkoutListTile extends StatelessWidget {
  final Workout workout;
  final VoidCallback onTap;

  WorkoutListTile({required this.workout, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          workout.imageUrl,
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(workout.name,
      style: TextStyle(
        color: Colors.white
      ),),
      subtitle: Text(workout.sub,
      style: TextStyle(
        color: Colors.orange
      ),
      ),
      onTap: onTap,
    );
  }
}
