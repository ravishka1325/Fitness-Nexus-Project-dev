import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gym_appfin/screens/login.dart';

typedef WeightUpdatedCallback = void Function(double newWeight);

class Profile extends StatefulWidget {
  final WeightUpdatedCallback? weightUpdatedCallback;

  const Profile({super.key, this.weightUpdatedCallback});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _username;
  String? _email;
  String? _profileImageUrl;
  final _weightController = TextEditingController();
  WeightUpdatedCallback? _weightUpdatedCallback;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _fetchUserData();
    _weightUpdatedCallback = widget.weightUpdatedCallback;
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('students').doc(userId).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          _username = data['username'];
          _email = data['email'];
          _profileImageUrl = data['profileImageUrl'];
          _weightController.text = data['weight']?.toString() ?? '';
        });
      }
    }
  }

Future<void> _signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  } catch (e) {
    print('Error signing out: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error signing out: $e'),
      ),
    );
  }
}

Future<void> _updateUserWeight(double newWeight) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      await userDocRef.update({
        'weight': newWeight,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Weight updated successfully')),
      );

      if (_weightUpdatedCallback != null) {
        _weightUpdatedCallback!(newWeight);
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating user weight: $e'),
        ),
      );
    }
  }

  Future<void> _showUpdateWeightDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Weight'),
          content: TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter new weight (kg)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                double newWeight = double.parse(_weightController.text.trim());
                await _updateUserWeight(newWeight);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

Future<void> _showChangePasswordDialog() async {
  await showDialog(
    context: context,
    builder: (context) {
      final _newPasswordController = TextEditingController();

      return AlertDialog(
        title: const Text('Change Password'),
        content: TextField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'New Password',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              String newPassword = _newPasswordController.text.trim();
              await _updatePassword(newPassword);
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

Future<void> _updatePassword(String newPassword) async {
  try {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('students').doc(userId);

    await userDocRef.update({
      'password': newPassword,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully')),
    );
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error updating password: $e'),
      ),
    );
  }
}

Future<void> _selectProfileImage() async {
  final picker = ImagePicker();
  try {
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 800,
    );

    if (pickedImage != null) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        String imageFileName = 'profile_$userId.jpg';
        Reference storageRef = FirebaseStorage.instance.ref().child('users/$imageFileName');
        UploadTask uploadTask = storageRef.putFile(File(pickedImage.path));
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'profileImageUrl': downloadUrl,
        });

        setState(() {
          _profileImageUrl = downloadUrl;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile picture updated successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not authenticated'),
          ),
        );
      }
    } else {
      print('No image selected.');
    }
  } catch (e) {
    print('Error selecting image: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error selecting image: $e'),
      ),
    );
  }
}


  
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      children: [
        const SizedBox(height: 24),
        Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: _selectProfileImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : const AssetImage('assets/images/white.jpg') as ImageProvider,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Edit photo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 249, 249, 249),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Container(
          alignment: Alignment.topCenter,
          child: ListTile(
            title: Text(
              _username ?? 'Loading...',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            subtitle: Text(
              _email ?? 'Loading...',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              _showChangePasswordDialog();
            },
            child: const Text('Change password'),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: _showUpdateWeightDialog,
            child: const Text('Update Weight'),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: _signOut, 
            child: const Text('Logout'),
          ),
        ),
        const SizedBox(height: 24),
      ],
    ),
    bottomNavigationBar: BottomNavBar(),
    backgroundColor: Colors.black,
  );
}}