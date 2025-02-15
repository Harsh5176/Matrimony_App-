import 'package:flutter/material.dart';
import 'package:mymatrimonyapp/OnboardingScreen2.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Forever and always, together as one",
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
                'assets/Newimages/couple_image2.jpg', // Replace with your asset image
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "We may not have it all together, but together we have it all",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 10, color: Colors.pink),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.grey),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Onboardingscreen2()));// Handle Skip action
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Next action
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Onboardingscreen2()));

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
    );
  }
}
