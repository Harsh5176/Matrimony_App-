import 'package:flutter/material.dart';
import 'package:mymatrimonyapp/NewDesign/Dashboard/Favourite.dart';
import '../colortheme.dart';
import '../database/Mydatabase.dart';
import 'AddUser.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> userData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final db = MyDataBase();
    final data = await db.selectAllUserData();
    setState(() {
      userData = data;
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite(int userId) async {
    try {
      final db = MyDataBase();
      final userIndex = userData.indexWhere((user) => user["ID"] == userId);
      if (userIndex == -1) return; // User not found

      int isFav = userData[userIndex]["IS_FAVOURITE"] == 1 ? 0 : 1;

      await db.FavouriteUser({"ID": userId, "IS_FAVOURITE": isFav});

      // Make a mutable copy before modifying
      setState(() {
        userData = List.from(userData);
        userData[userIndex] = {...userData[userIndex], "IS_FAVOURITE": isFav};
      });

      print('Favourite user updated: ${userData[userIndex]}');
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
          content: Text("Are you sure you want to unfavorite this user?"),
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

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  void _showUserDetails(BuildContext context, Map<String, dynamic> user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Newimages/images.png'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                user["FullName"],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Age: ${_calculateAge(user["DateOfBirth"])}",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              InfoRow(label: 'ID', value: user["ID"].toString()),
              InfoRow(label: 'DOB', value: user["DateOfBirth"]),
              InfoRow(label: 'Phone', value: user["MobileNumber"]),
              InfoRow(label: 'E-mail', value: user["EmailAddress"]),
              InfoRow(label: 'City', value: user["City"]),
              InfoRow(label: 'Gender', value: user["Gender"]),
              InfoRow(label: 'Hobbies', value: user["Hobbies"]),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Close"),
                ),
              ),
            ],
          ),
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
            : ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final user = userData[index];
                  return GestureDetector(
                    onTap: () => _showUserDetails(context, user),
                    child: Center(
                      child: Card(
                        color: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _showFullScreenImage(
                                        context, 'assets/Newimages/images.png'),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/Newimages/images.png'),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (user["IS_FAVOURITE"] == 1) {
                                        _confirmUnfavorite(context, user["ID"]);
                                      } else {
                                        _toggleFavorite(user["ID"])
                                            .then((value) => setState(() {}));
                                      }
                                    },
                                    icon: Icon(
                                      user["IS_FAVOURITE"] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddUser(user: user),
                                        ),
                                      ).then((_) {
                                        _loadUserData(); // Refresh the list after update
                                      });
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),


                                  IconButton(
                                    onPressed: () async {
                                      bool? confirmDelete = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Confirm Deletion"),
                                            content: Text("Are you sure you want to delete ${user["FullName"]}?"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(false); // Cancel
                                                },
                                                child: Text("Cancel"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(true); // Confirm
                                                },
                                                child: Text("Delete", style: TextStyle(color: Colors.red)),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (confirmDelete == true) {
                                        try {
                                          final db = MyDataBase();
                                          bool isDeleted = await db.deleteUserData(user["ID"]);

                                          if (isDeleted) {
                                            setState(() {
                                              userData.removeWhere((u) => u["ID"] == user["ID"]);
                                            });

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("${user["FullName"]} deleted successfully!"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Failed to delete ${user["FullName"]}!"),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text("Error: $e"),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
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
    print("DOB is $dob");
    try {
      final birthDate = DateTime.parse(dob);
      final currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }
      return age.toString();
    } catch (e) {
      print("Error is in DOB :: $e");
      return "Unknown";
    }
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
