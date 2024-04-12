import 'package:gym_appfin/screens/login.dart';
import 'package:gym_appfin/screens/signuppage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: [
            Color(0xff000000),
            Color(0xff000000),
          ]
        )
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(child: Image(image: AssetImage('assets/images/logoo.png'))),
            ),
            SizedBox(
              height: 1,
            ),
            Image(image:  AssetImage('assets/images/dumbell.png'),),
            
            SizedBox(height: 2,),            
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                   color: Color(0xffff5722),
                  borderRadius: BorderRadius.circular(30),
                  
                ),
                child: Center(child: Text('LOGIN',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),),),
              ),
            ),
            SizedBox(height: 20,),
           GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signuppage()));
            },
             child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xffff5722),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xffff5722),)
                ),
                child: Center(child: Text('SIGN UP',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),),
              ),
              
           ),
          ],
        ),
      ),
    );
  }
}