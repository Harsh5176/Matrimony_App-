import 'package:flutter/material.dart';
import '../colortheme.dart';
import '../database/Mydatabase.dart';
import 'AddUser.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Map<String, dynamic>> favoriteUsers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFavoriteUsers();
  }

  Future<void> _fetchFavoriteUsers() async {
    final db = MyDataBase();
    List<Map<String, dynamic>> users = await db.getFavoriteUsers();
    setState(() {
      favoriteUsers = users;
      _isLoading = false;
    });
  }

  void _toggleFavorite(int userId) async {
    try {
      final db = MyDataBase();
      final userIndex = favoriteUsers.indexWhere((user) => user["ID"] == userId);
      if (userIndex == -1) return;

      final isFav = favoriteUsers[userIndex]["IS_FAVOURITE"] == 1 ? 0 : 1;
      await db.updateFavoriteStatus(userId, isFav);

      setState(() {
        if (isFav == 1) {
          favoriteUsers[userIndex]["IS_FAVOURITE"] = 1;
        } else {
          favoriteUsers.removeAt(userIndex);
        }
      });
    } catch (e) {
      print("Error updating favorite status: $e");
    }
  }

  void _confirmUnfavorite(BuildContext context, int userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Unfavorite"),
          content: Text("Are you sure you want to remove this user from favorites?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Unfavorite", style: TextStyle(color: Colors.red)),
              onPressed: () {
                _toggleFavorite(userId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : favoriteUsers.isEmpty
            ? Center(
          child: Text(
            'No favorite users yet.',
            style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
          ),
        )
            : ListView.builder(
          itemCount: favoriteUsers.length,
          itemBuilder: (context, index) {
            final user = favoriteUsers[index];
            return GestureDetector(
              onTap: () {}, // No bottom sheet needed for favorites
              child: Center(
                child: Card(
                  color: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/Newimages/images.png'),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user["FullName"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  "Age: ${_calculateAge(user["DateOfBirth"])}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () => _confirmUnfavorite(context, user["ID"]),
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddUser(user: user),
                                  ),
                                ).then((_) {
                                  _fetchFavoriteUsers();
                                });
                              },
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),


                            IconButton(
                              onPressed: () async {
                                final db = MyDataBase();
                                await db.deleteUserData(user["ID"]);
                                setState(() {
                                  favoriteUsers.removeWhere((u) => u["ID"] == user["ID"]);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${user["FullName"]} deleted successfully!"),
                                  ),
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _calculateAge(String dob) {
    try {
      final birthDate = DateTime.parse(dob);
      final currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
        age--;
      }
      return age.toString();
    } catch (e) {
      return "Unknown";
    }
  }
}
