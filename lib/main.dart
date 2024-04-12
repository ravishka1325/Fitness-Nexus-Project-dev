import 'dart:io';
import 'package:gym_appfin/screens/home.dart';
import 'package:gym_appfin/screens/profile.dart';
import 'package:gym_appfin/screens/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_appfin/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/datapush/RTDB.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: 'AIzaSyBlxJ88-dtFnPZUZqwtJKMfinC8RUk7jLg',
            appId: '1:900951290749:android:82ed1ae0cdd42814f3d214',
            messagingSenderId: '900951290749',
            projectId: 'finalfitness-7212a',
            storageBucket: 'gs://finalfitness-7212a.appspot.com'
          )
        : null,
  );

  
  

  bool _isInitialized = false;

  Future<void> initializeExercises() async {
    try {
      addBeginnerLevelExercises();
      addIntermediateLevelExercises();
      addAdvancedLevelExercisesForMales();
      addAdvancedLevelExercisesForFemales();
    } catch (e) {
      print('Error initializing exercises: $e');
    }
  }

  if (!_isInitialized) {
    await initializeExercises();
    _isInitialized = true;
  }

  runApp(
    const MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
  await Future.delayed(const Duration(seconds: 3));

  runApp(
    const MyApp(),
  );
  runApp(
    const MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(
            0,
            16,
            247,
            1,
          ),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      fixedColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Colors.deepOrange,
    );
  }
}