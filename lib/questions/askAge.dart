import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/questions/askHeight.dart';

class AskAge extends StatefulWidget {
  const AskAge({super.key});

  @override
  State<AskAge> createState() => _AskAgeState();
}

class _AskAgeState extends State<AskAge> {
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _updateUserAge() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      DocumentSnapshot userSnapshot = await userDocRef.get();

      if (userSnapshot.exists) {
        await userDocRef.update({
          'age': int.parse(_ageController.text.trim()),
        });
      } else {
        await userDocRef.set({
          'age': int.parse(_ageController.text.trim()),
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const askHeight()),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating user age: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff000000),
                  Color(0xff000000),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 22),
              child: Text(
                'TELL US ABOUT YOUR SELF',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 4,
                  decorationColor: Color(0xffff5722),
                  fontSize: 25,
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                Shadow(
                    color: Colors.white,
                    offset: Offset(0, -12))
              ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 128, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'We collect gender information in the app to customize workouts and provide targeted health advice based on individual needs',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  controller: _ageController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffff5722)),
                    ),
                    label: Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: _updateUserAge,
                  child: Container(
                    height: 55,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffff5722),
                          Color(0xffff5722),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}