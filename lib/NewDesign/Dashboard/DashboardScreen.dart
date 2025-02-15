import 'package:flutter/material.dart';
import 'AboutUs.dart';
import 'AddUser.dart';
import 'Favourite.dart';
import 'UserList.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Darshan Matrimony'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/images.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTile(
                      Icons.person_add,
                      'Add User',
                      Colors.blueAccent,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddUser(),
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      Icons.list,
                      'User List',
                      Colors.deepOrange,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTile(
                      Icons.favorite,
                      'Favourite',
                      Colors.pinkAccent,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Favourite(),
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      Icons.info,
                      'About Us',
                      Colors.green,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutUs(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: color,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}