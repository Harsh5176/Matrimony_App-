import 'package:flutter/material.dart';

import '../NewDesign/Dashboard/DashboardScreen.dart';


class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Darshan Matrimony"),
      ),
      
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
              )
            ),
          ),

          //transparent-overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          //contant
          Center(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ring1-removebg-preview.png"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  // Icon(
                  //   Icons.favorite, // Use a wedding ring icon if available
                  //   size: 100,
                  //   color: Colors.white,
                  // ),


                  Text(
                    'Find your\nBest Partner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Serif', // Use a serif font for elegance
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Join Us and make a good partner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 30),

                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboardscreen()));
                  }, child: Text("enter"),
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
