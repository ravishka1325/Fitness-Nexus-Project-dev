import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_appfin/questions/askAge.dart';

class PickGender extends StatefulWidget {
  const PickGender({Key? key}) : super(key: key);

  @override
  _PickGenderState createState() => _PickGenderState();
}

class _PickGenderState extends State<PickGender> {
  String? selectedGender;

  Future<void> _updateUserGender(String gender) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      DocumentSnapshot userSnapshot = await userDocRef.get();

      if (userSnapshot.exists) {
        await userDocRef.update({
          'gender': gender,
        });
      } else {
        await userDocRef.set({
          'gender': gender,
        });
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AskAge()),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating user gender: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
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
SizedBox(height: 16,)
            ,Container(
              
              padding: EdgeInsets.only(left: 23 ,right:15 ),
             child:  Text(
                  'We collect height information in the app to personalize exercise routines and ensure proper alignment with users physical attributes for optimal performance and safety',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
            ),
            Expanded
            (
              
              child: Center(
                
                child: Column(
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GenderButton(
                      gender: 'Male',
                      isSelected: selectedGender == 'male',
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                        _updateUserGender('male');
                      },
                    ),
                    SizedBox(height: 32),
                    GenderButton(
                      gender: 'Female',
                      isSelected: selectedGender == 'female',
                      onTap: () {
                        setState(() {
                          selectedGender = 'female';
                        });
                        _updateUserGender('female');
                      },
                    ),
                    SizedBox(height: 48),
                    _NextButton(
                      onPressed: () {
                        if (selectedGender != null) {
                          _updateUserGender(selectedGender!);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    Key? key,
    required this.gender,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == 'Male' ? Icons.male : Icons.female,
                color: isSelected ? Colors.deepOrange : Colors.grey.shade600,
              ),
              SizedBox(width: 8),
              Text(
                gender,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.deepOrange : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _NextButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Next',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}