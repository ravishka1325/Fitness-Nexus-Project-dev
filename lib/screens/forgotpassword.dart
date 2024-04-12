import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class forgotpw extends StatefulWidget {
  const forgotpw({super.key});

  @override
  State<forgotpw> createState() => _forgotpwState();
}

class _forgotpwState extends State<forgotpw> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
         builder:(context){
          return AlertDialog(

            content: Text(e.message.toString()),

          );
         }
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
                'FORGOT PASSWORD',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 4,
                  decorationColor: Color(0xffff5722),
                  fontSize: 29,
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold,
                  
               shadows: [

                 Shadow(
                    color: Colors.white,
                    offset: Offset(0, -12))
               ]
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
                  'ENTER YOUR EMAIL AND WILL SEND YOU A PASSWORD RESET LINK',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffff5722))),
                    label: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
               MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.5,
                
  onPressed: () => passwordReset(),
  child: Text('Reset Password'),
  color: Colors.deepOrange,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
)

              ],
            ),
          ),
        ],
      ),
    );
  }
}