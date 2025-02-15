import 'package:flutter/material.dart';
import '../Dashboard/AboutUs.dart';
import '../Dashboard/AddUser.dart';
import '../Dashboard/Favourite.dart';
import '../Dashboard/UserList.dart';
import '../colortheme.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            buildCard(Icons.person_add, "Add User", AppColors.accent, AddUser()),
            buildCard(Icons.list, "User List", AppColors.surface, UserList()),
            buildCard(Icons.favorite, "Favourite", AppColors.primary, Favourite()),
            buildCard(Icons.info, "About Us", AppColors.secondary, AboutUs()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.search, color: Colors.white),
      ),
    );
  }

  Widget buildCard(IconData icon, String title, Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================
// SEARCH SCREEN
// =============================
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> allUsers = [
    {"name": "John Doe", "email": "john@example.com"},
    {"name": "Alice Smith", "email": "alice@example.com"},
    {"name": "Bob Johnson", "email": "bob@example.com"},
  ];
  List<Map<String, String>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers; // Initially show all users
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = allUsers
          .where((user) =>
          user["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search users...",
            border: InputBorder.none,
          ),
          onChanged: filterUsers,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredUsers[index]["name"]!),
            subtitle: Text(filteredUsers[index]["email"]!),
            leading: Icon(Icons.person),
          );
        },
      ),
    );
  }
}
