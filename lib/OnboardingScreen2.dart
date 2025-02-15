import 'package:flutter/material.dart';
import 'package:mymatrimonyapp/NewDesign/Dashboard/HomePage.dart';

import 'NewDesign/Dashboard/BottomNaviBar.dart';



class Onboardingscreen2 extends StatefulWidget {
  const Onboardingscreen2({super.key});

  @override
  State<Onboardingscreen2> createState() => _Onboardingscreen2State();
}

class _Onboardingscreen2State extends State<Onboardingscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Find Your Perfect Match",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Image.asset(
                'assets/Newimages/couple_image.jpg', // Replace with your asset image
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Meet love of your life",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.pink),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNaviBar()));

                      // Handle Skip action
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Next action
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNaviBar()));

                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );;
  }
}
