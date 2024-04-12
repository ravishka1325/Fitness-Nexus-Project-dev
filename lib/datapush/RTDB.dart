import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}

final databaseReference = FirebaseDatabase.instance.ref();

void addBeginnerLevelExercises() async {
  // Male under 20 - Beginner Level
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Push-ups',
    'assets/images/pushup.gif',
    '8 sets x 3 reps',
    'Start in plank position. Lower body until elbows at 90°. Push back up. Keep body straight. Engage core. Repeat for desired reps.',
  );
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Squats',
    'assets/images/Squats.gif',
    '12 sets x 3 reps',
    'Stand, feet shoulder-width apart. Lower hips, bending knees. Keep chest up. Push through heels to stand. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Lunges',
    'assets/images/Lunges.gif',
    '15 sets x 3 reps',
    'Stand tall. Step forward with one leg. Lower hips until both knees bent 90°. Push back up. Alternate legs.',
  );
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Dumbbell Rows',
    'assets/images/Dumbbell-row.gif',
    '12 sets x 3 reps',
    'Hold dumbbells, palms facing in. Bend knees slightly, hinge at hips. Pull weights to sides. Lower and repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Shoulder Press',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Hold dumbbells at shoulder height. Push weights up overhead. Lower to starting position. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'beginner',
    'Plank',
    'assets/images/Plank.jpg',
    '2 sets x 1 minute',
    'Lie face down. Lift body onto forearms and toes. Keep body straight. Engage core. Hold position. Release and repeat.',
  );

  // Female under 20 - Beginner Level
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Push-ups',
    'assets/images/pushup.gif',
    '8 sets x 3 reps',
    'Start in plank position. Lower body until elbows at 90°. Push back up. Keep body straight. Engage core. Repeat for desired reps.',
  );
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Squats',
    'assets/images/Squats.gif',
    '12 sets x 3 reps',
    'Stand, feet shoulder-width apart. Lower hips, bending knees. Keep chest up. Push through heels to stand. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Lunges',
    'assets/images/Lunges.gif',
    '15 sets x 3 reps',
    'Stand tall. Step forward with one leg. Lower hips until both knees bent 90°. Push back up. Alternate legs.',
  );
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Dumbbell Rows',
    'assets/images/Dumbbell-row.gif',
    '12 sets x 3 reps',
    'Hold dumbbells, palms facing in. Bend knees slightly, hinge at hips. Pull weights to sides. Lower and repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Shoulder Press',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Hold dumbbells at shoulder height. Push weights up overhead. Lower to starting position. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'beginner',
    'Plank',
    'assets/images/Plank.jpg',
    '2 sets x 1 minute',
    'Lie face down. Lift body onto forearms and toes. Keep body straight. Engage core. Hold position. Release and repeat.',
  );
}
void addIntermediateLevelExercises() async {
  // Male under 20 - Intermediate Level
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Stand with feet hip-width apart. Bend knees, grip barbell. Lift with straight back. Lower and repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Pull-ups',
    'assets/images/pullup-square-2sx.gif',
    '10 sets x 3 reps',
    'Hang from bar, palms facing away. Pull body up. Lower with control. Engage core. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Bench Press',
    'assets/images/bench-press.gif',
    '10 sets x 3 reps',
    'Lie on bench. Grip barbell, lower to chest. Push up. Keep back flat. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Russian Twists',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit on floor. Lean back slightly. Rotate torso side to side. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Leg Press',
    'assets/images/Leg Press.gif',
    '10 sets x 3 reps',
    'Sit on leg press machine. Push platform with feet. Extend legs fully. Bend knees and repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'intermediate',
    'Tricep Dips',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Sit on edge of bench. Grip bench, extend legs. Lower body. Push back up. Repeat.',
  );

  // Female under 20 - Intermediate Level
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Stand with feet hip-width apart. Bend knees, grip barbell. Lift with straight back. Lower and repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Pull-ups',
    'assets/images/pullup-square-2sx.gif',
    '10 sets x 3 reps',
    'Hang from bar, palms facing away. Pull body up. Lower with control. Engage core. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Bench Press',
    'assets/images/bench-press.gif',
    '10 sets x 3 reps',
    'Lie on bench. Grip barbell, lower to chest. Push up. Keep back flat. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Russian Twists',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit on floor. Lean back slightly. Rotate torso side to side. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Leg Press',
    'assets/images/Leg Press.gif',
    '10 sets x 3 reps',
    'Sit on leg press machine. Push platform with feet. Extend legs fully. Bend knees and repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'intermediate',
    'Tricep Dips',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Sit on edge of bench. Grip bench, extend legs. Lower body. Push back up. Repeat.',
  );
}
void addAdvancedLevelExercisesForMales() async {
  // Male under 20 - Advanced Level
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Stand with feet hip-width apart. Bend knees, grip barbell. Lift with straight back. Lower and repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Pull-ups',
    'assets/images/pullup-square-2sx.gif',
    '10 sets x 3 reps',
    'Hang from bar, palms facing away. Pull body up. Lower with control. Engage core. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Bench Press',
    'assets/images/bench-press.gif',
    '10 sets x 3 reps',
    'Lie on bench. Grip barbell, lower to chest. Push up. Keep back flat. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Chest Flyes',
    'assets/images/Cable chest press.gif',
    '10 sets x 3 reps',
    'Lie on bench, arms extended. Lower weights wide. Return.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Cable Chest Press',
    'assets/images/Cable chest press.gif',
    '10 sets x 3 reps',
    'Stand, cables at chest height. Push handles forward. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Russian Twists',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit on floor. Lean back slightly. Rotate torso side to side. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Leg Press',
    'assets/images/Leg Press.gif',
    '10 sets x 3 reps',
    'Sit on leg press machine. Push platform with feet. Extend legs fully. Bend knees and repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Tricep Dips',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Sit on edge of bench. Grip bench, extend legs. Lower body. Push back up. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Squat Jumps',
    'assets/images/400x400_Squat_Jumps-1.gif',
    '10 sets x 3 reps',
    'Squat down, explosively jump up. Land softly, repeat motion.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Burpees',
    'assets/images/burpee.gif',
    '10 sets x 3 reps',
    'Start in squat position. Jump back to plank. Jump up. Repeat.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Mountain Climbers',
    'assets/images/400x400_9_Best_Bodyweight_Shoulder_Exercises_for_Every_Body_Mountain_Climbers-1.gif',
    '10 sets x 3 reps',
    'Start in plank. Drive knees towards chest alternately.',
  );
  await _addExercise(
    'male',
    'below20',
    'advanced',
    'Box Jumps',
    'assets/images/Box-Jumps.gif',
    '10 sets x 3 reps',
    'Stand facing box or platform. Jump onto it, step down.',
  );
}

void addAdvancedLevelExercisesForFemales() async {
  // Female under 20 - Advanced Level
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Stand with feet hip-width apart. Bend knees, grip barbell. Lift with straight back. Lower and repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Pull-ups',
    'assets/images/pullup-square-2sx.gif',
    '10 sets x 3 reps',
    'Hang from bar, palms facing away. Pull body up. Lower with control. Engage core. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Bench Press',
    'assets/images/bench-press.gif',
    '10 sets x 3 reps',
    'Lie on bench. Grip barbell, lower to chest. Push up. Keep back flat. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Russian Twists',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit on floor. Lean back slightly. Rotate torso side to side. Keep core engaged. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Leg Press',
    'assets/images/Leg Press.gif',
    '10 sets x 3 reps',
    'Sit on leg press machine. Push platform with feet. Extend legs fully. Bend knees and repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Tricep Dips',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Sit on edge of bench. Grip bench, extend legs. Lower body. Push back up. Repeat.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Hip Thrusts',
    'assets/images/hip-thrust-female.gif',
    '10 sets x 3 reps',
    'Sit on ground, back against bench. Lift hips up.',
  );
  await _addExercise(
    'female',
    'below20',
    'advanced',
    'Glute Bridges',
    'assets/images/Glute_Bridge.gif',
    '10 sets x 3 reps',
    'Lie on back, knees bent. Lift hips up. Repeat.',
  );

  //male over 20
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Walking lunges',
    'assets/images/Lunges.gif',
    '12 sets x 3 reps',
    'Step forward, bend knees. Alternate legs. Keep torso upright.',
  );
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Bodyweight Squats',
    'assets/images/Squats.gif',
    '14 sets x 3 reps',
    'Stand with feet shoulder-width apart. Lower, then stand.',
  );
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Push-ups',
    'assets/images/pushup.gif',
    '12 sets x 3 reps',
    'Start in plank. Lower body, push back up.',
  );
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Plank',
    'assets/images/Plank.jpg',
    '2 sets x 1 minute',
    'Hold push-up position. Keep body straight. Engage core.',
  );
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Jumping Jacks',
    'assets/images/benchpress.png',
    '20 sets x 3 reps',
    'Jump feet wide, arms overhead. Return to start',
  );
  await _addExercise(
    'male',
    'below40',
    'beginner',
    'Bicycle Crunches',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Lie on back, knees bent. Rotate torso, alternate sides.',
  );

  // Female over 20 - Beginner Level
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Walking lunges',
    'assets/images/Lunges.gif',
    '12 sets x 3 reps',
    'Step forward, bend knees. Alternate legs. Keep torso upright.',
  );
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Bodyweight Squats',
    'assets/images/Squats.gif',
    '14 sets x 3 reps',
    'Stand with feet shoulder-width apart. Lower, then stand.',
  );
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Push-ups',
    'assets/images/pushup.gif',
    '12 sets x 3 reps',
    'Start in plank. Lower body, push back up.',
  );
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Plank',
    'assets/images/Plank.jpg',
    '2 sets x 1 minute',
    'Hold push-up position. Keep body straight. Engage core.',
  );
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Jumping Jacks',
    'assets/images/benchpress.png',
    '20 sets x 3 reps',
    'Jump feet wide, arms overhead. Return to start',
  );
  await _addExercise(
    'female',
    'below40',
    'beginner',
    'Bicycle Crunches',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Lie on back, knees bent. Rotate torso, alternate sides.',
  );

    // Male below 40 - Intermediate Level
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Dumbbell Lunges',
    'assets/images/Lunges.gif',
    '10 sets x 3 reps',
    'Hold dumbbells. Step forward, lunge. Alternate legs.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Renegade Rows',
    'assets/images/Dumbbell-row.gif',
    '10 sets x 3 reps',
    'Start in plank. Row dumbbell each side. Keep stable.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Dumbbell Shoulder Press',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Stand, dumbbells at shoulders. Push overhead. Lower. Repeat.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Romanian Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Hold barbell, feet hip-width apart. Hinge at hips. Lift, lower.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Plank with Leg Lifts',
    'assets/images/Plank.jpg',
    '10 sets x 3 reps',
    'Hold plank position. Lift one leg. Alternate.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Russian Twists with Weight',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit, hold weight. Rotate torso side to side.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Tricep Kickbacks',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Hold dumbbells, hinge at hips. Extend arms back.',
  );
  await _addExercise(
    'male',
    'below40',
    'intermediate',
    'Stability Ball Rollouts',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Kneel, hands on ball. Roll ball forward. Return.',
  );

  // Female below 40 - Intermediate Level
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Dumbbell Lunges',
    'assets/images/Lunges.gif',
    '10 sets x 3 reps',
    'Hold dumbbells. Step forward, lunge. Alternate legs.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Renegade Rows',
    'assets/images/Dumbbell-row.gif',
    '10 sets x 3 reps',
    'Start in plank. Row dumbbell each side. Keep stable.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Dumbbell Shoulder Press',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Stand, dumbbells at shoulders. Push overhead. Lower. Repeat.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Romanian Deadlifts',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Hold barbell, feet hip-width apart. Hinge at hips. Lift, lower.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Plank with Leg Lifts',
    'assets/images/Plank.jpg',
    '10 sets x 3 reps',
    'Hold plank position. Lift one leg. Alternate.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Russian Twists with Weight',
    'assets/images/Russian_Twists.gif',
    '10 sets x 3 reps',
    'Sit, hold weight. Rotate torso side to side.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Tricep Kickbacks',
    'assets/images/Tricep Dips.gif',
    '10 sets x 3 reps',
    'Hold dumbbells, hinge at hips. Extend arms back.',
  );
  await _addExercise(
    'female',
    'below40',
    'intermediate',
    'Stability Ball Rollouts',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Kneel, hands on ball. Roll ball forward. Return.',
  );
await _addExercise(
    'male',
    'below40',
    'advanced',
    'Barbell Squats',
    'assets/images/Squats.gif',
    '12 sets x 3 reps',
    'Rack barbell, squat down. Push up. Maintain form.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Deadlift Variations',
    'assets/images/Deadlift.gif',
    '12 sets x 3 reps',
    'Conventional, sumo, trap bar. Lift with proper form.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Bench Press Variations',
    'assets/images/bench-press.gif',
    '12 sets x 3 reps',
    'Flat, incline, decline. Use proper technique.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Pull-up Variations',
    'assets/images/pullup-square-2sx.gif',
    '12 sets x 3 reps',
    'Wide, narrow, weighted. Focus on full range.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Dumbbell Rows',
    'assets/images/Dumbbell-row.gif',
    '12 sets x 3 reps',
    'Hinge at hips, row dumbbells. Keep back straight.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Overhead Press',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Push barbell or dumbbells overhead. Control movement.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Barbell Lunges',
    'assets/images/Lunges.gif',
    '12 sets x 3 reps',
    'Step forward, lunge down. Maintain balance and form.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Romanian Deadlifts',
    'assets/images/Deadlift.gif',
    '12 sets x 3 reps',
    'Hinge at hips, lower barbell. Keep back straight.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Weighted Dips',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Support on bars, lower body. Push up. Strengthen triceps.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Barbell Curls',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Curl barbell, control movement. Focus on biceps.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Bent-over Rows',
    'assets/images/Dumbbell-row.gif',
    '12 sets x 3 reps',
    'Hinge at hips, row barbell. Keep back straight.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Box Jumps',
    'assets/images/Box-Jumps.gif',
    '12 sets x 3 reps',
    'Jump onto box or platform. Explosive power exercise.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Farmer\'s Walks',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Hold heavy dumbbells or kettlebells. Walk with control.',
  );
  await _addExercise(
    'male',
    'below40',
    'advanced',
    'Battle Ropes',
    'assets/images/benchpress.png',
    '12 sets x 3 reps',
    'Grip ropes, alternate waves. Engage core and arms.',
  );

  // Female below 40 - Advanced Level
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Deadlift Variations',
    'assets/images/Deadlift.gif',
    '10 sets x 3 reps',
    'Sumo, Romanian, single-leg. Focus on form and control.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Barbell Hip Thrusts',
    'assets/images/hip-thrust-female.gif',
    '10 sets x 3 reps',
    'Support back on bench, thrust hips up.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Kettlebell Swings',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Hinge at hips, swing kettlebell forward.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Bulgarian Split Squats',
    'assets/images/Squats.gif',
    '10 sets x 3 reps',
    'Rear foot elevated, lower into lunge.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Single-Leg Deadlifts',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Hinge at hips, lift leg behind. Balance.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Glute-Ham Raises',
    'assets/images/Glute_Bridge.gif',
    '10 sets x 3 reps',
    'Anchor feet, lower body. Engage hamstrings and glutes.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Barbell Bridges',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Lie on back, thrust hips up. Engage glutes.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Box Squats',
    'assets/images/Squats.gif',
    '10 sets x 3 reps',
    'Lower onto box, rise up. Focus on depth.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Pull-ups (Assisted)',
    'assets/images/pullup-square-2sx.gif',
    '10 sets x 3 reps',
    'Use bands or machine for assistance. Strengthen upper body.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Pistol Squats',
    'assets/images/Squats.gif',
    '10 sets x 3 reps',
    'Lower into single-leg squat. Focus on balance and control.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'Plank Variations',
    'assets/images/benchpress.png',
    '10 sets x 3 reps',
    'Side plank, plank with leg lift. Engage core.',
  );
  await _addExercise(
    'female',
    'below40',
    'advanced',
    'TRX Rows',
    'assets/images/Dumbbell-row.gif',
    '10 sets x 3 reps',
    'Hold TRX handles, lean back, pull body up.',
  );

}













Future<void> _addExercise(
  String gender,
  String ageGroup,
  String level,
  String name,
  String imageUrl,
  String sub,
  String description,
) async {
  final exercisesRef = databaseReference
      .child('workoutPlans')
      .child(gender)
      .child(ageGroup)
      .child(level)
      .child('exercises');

  //meken data duplication nawaththuwe
  final snapshot = await exercisesRef.orderByChild('name').equalTo(name).once();
  if (snapshot.snapshot.value != null) {
    
    return;
  }

 
  final exerciseRef = exercisesRef.push();
  await exerciseRef.set({
    'name': name,
    'imageUrl': imageUrl,
    'sub': sub,
    'description': description,
  });
}