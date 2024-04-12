import 'package:gym_appfin/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
    final String image, title, description, buttonText;
    final Function onPressed;
    

    const OnboardingCard({
        super.key,
        required this.image,
        required this.title,
        required this.description,
        required this.buttonText,
        required this.onPressed,
      }
    );
    
    

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height* 0.80,
      width: MediaQuery.sizeOf(context).height* 0.80,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          
          Column(children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
          ),
          ),
              Text(
                description,
                textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffff5722),
              fontSize: 25,
              fontWeight: FontWeight.bold,
          ),
          )
          ],
          ),
          
          MaterialButton(
            height: 55,
            minWidth: 300,
            onPressed: () =>onPressed(

              

            ),
            color: Color(0xffff5722),
            child: Text(
             buttonText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ]
      ),

    );
  }
}