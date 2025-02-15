// // // about us page
// //
// // import 'package:flutter/material.dart';
// //
// // class AboutUs extends StatelessWidget {
// //   const AboutUs({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Center(
// //                 child: Column(
// //                   children: [
// //                     Icon(Icons.favorite, size: 80, color: Colors.redAccent),
// //                     SizedBox(height: 8),
// //                     Text(
// //                       'Typing Tutor',
// //                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.redAccent),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               SectionCard(
// //                 title: 'Meet Our Team',
// //                 content: [
// //                   'Developed by: Harsh Vekariya(23010101297)',
// //                   'Mentored by: Prof. Mehul Bhundiya (Computer Engineering Department, School of Computer Science)',
// //                   'Explored by: ASWDC, School Of Computer Science, School of Computer Science',
// //                   'Eulogized by: Darshan University, Rajkot, Gujarat - INDIA',
// //                 ],
// //                 backgroundColor: Color.fromRGBO(212, 196, 228, 1),
// //                 titleColor: Color.fromRGBO(172, 84, 228, 1),
// //               ),
// //               SectionCard(
// //                 title: 'About ASWDC',
// //                 content: [
// //                   'ASWDC is Application, Software and Website Development Center @ Darshan University run by Students and Staff of School Of Computer Science.',
// //                   'Sole purpose of ASWDC is to bridge the gap between university curriculum & industry demands.',
// //                   'Students learn cutting-edge technologies, develop real-world applications & experience a professional environment @ ASWDC under the guidance of industry experts & faculty members.',
// //                 ],
// //                 backgroundColor: Color.fromRGBO(212, 196, 228, 1),
// //                 titleColor: Color.fromRGBO(172, 84, 228, 1),
// //               ),
// //               SectionCard(
// //                 title: 'Contact Us',
// //                 content: [
// //                   'Email: aswdc@darshan.ac.in',
// //                   'Phone: +91-9727747317',
// //                   'Website: www.darshan.ac.in',
// //                 ],
// //                 backgroundColor: Color.fromRGBO(212, 196, 228, 1),
// //                 titleColor: Color.fromRGBO(172, 84, 228, 1),
// //               ),
// //               SectionCard(
// //                 title: 'More Options',
// //                 content: [
// //                   'Share App',
// //                   'More Apps',
// //                   'Rate Us',
// //                   'Like us on Facebook',
// //                   'Check for Updates',
// //                 ],
// //                 backgroundColor: Color.fromRGBO(212, 196, 228, 1),
// //                 titleColor: Color.fromRGBO(172, 84, 228, 1),
// //               ),
// //               SizedBox(height: 20),
// //               Center(
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       '© 2025 Darshan University',
// //                       style: TextStyle(fontSize: 14, color: Colors.grey),
// //                     ),
// //                     Text(
// //                       'All Rights Reserved - Privacy Policy',
// //                       style: TextStyle(fontSize: 14, color: Color.fromRGBO(76, 36, 116, 1)),
// //                     ),
// //                     Text(
// //                       'Made with ❤️ in India',
// //                       style: TextStyle(fontSize: 14, color: Color.fromRGBO(76, 36, 116, 1)),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );;
// //   }
// // }
// // class SectionCard extends StatelessWidget {
// //   final String title;
// //   final List<String> content;
// //   final Color backgroundColor;
// //   final Color titleColor;
// //
// //   SectionCard({
// //     required this.title,
// //     required this.content,
// //     required this.backgroundColor,
// //     required this.titleColor,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 3,
// //       margin: EdgeInsets.symmetric(vertical: 10),
// //       color: backgroundColor,
// //       child: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               title,
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: titleColor,
// //               ),
// //             ),
// //             SizedBox(height: 8),
// //             ...content.map((text) => Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 4.0),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(fontSize: 14, color: Colors.black87),
// //               ),
// //             )),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // //add user page
// //
// // import 'package:flutter/material.dart';
// // import '../../database/ListMethods.dart';
// // import 'UserList.dart';
// //
// // class AddUser extends StatefulWidget {
// //   final Map<String, dynamic>? user; // Nullable user for editing mode
// //
// //   AddUser({this.user});
// //
// //   @override
// //   _AddUserState createState() => _AddUserState();
// // }
// //
// // class _AddUserState extends State<AddUser> {
// //   final _formKey = GlobalKey<FormState>();
// //
// //   // Controllers for text fields
// //   final TextEditingController _fullNameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _mobileController = TextEditingController();
// //   final TextEditingController _dobController = TextEditingController();
// //   final TextEditingController _cityController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController = TextEditingController();
// //
// //   String? _gender;
// //   List<String> _hobbies = [];
// //   final List<String> _hobbyOptions = ['Reading', 'Traveling', 'Cooking', 'Gaming'];
// //
// //   int? IS_FAVOURITE;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Pre-fill the fields if user data is provided
// //     if (widget.user != null) {
// //       _fullNameController.text = widget.user!['FullName'];
// //       _emailController.text = widget.user!['EmailAddress'];
// //       _mobileController.text = widget.user!['MobileNumber'];
// //       _dobController.text = widget.user!['DateOfBirth'];
// //       _cityController.text = widget.user!['City'];
// //       _gender = widget.user!['Gender'];
// //       _hobbies = widget.user!['Hobbies']?.split(', ') ?? [];
// //       IS_FAVOURITE = widget.user?['IS_FAVOURITE'] ?? 0;
// //       _passwordController.text = widget.user!['Password'];
// //       _confirmPasswordController.text = widget.user!['Password']; // Set default confirm password as well
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: ListView(
// //             children: [
// //               // Full Name Field
// //               TextFormField(
// //                 controller: _fullNameController,
// //                 decoration: InputDecoration(labelText: "Full Name"),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please enter your full name";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // Email Address Field
// //               TextFormField(
// //                 controller: _emailController,
// //                 decoration: InputDecoration(labelText: "Email Address"),
// //                 keyboardType: TextInputType.emailAddress,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please enter your email address";
// //                   }
// //                   if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}').hasMatch(value)) {
// //                     return "Please enter a valid email address";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // Mobile Number Field
// //               TextFormField(
// //                 controller: _mobileController,
// //                 decoration: InputDecoration(labelText: "Mobile Number"),
// //                 keyboardType: TextInputType.phone,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please enter your mobile number";
// //                   }
// //                   if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
// //                     return "Please enter a valid 10-digit mobile number";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // Date of Birth Field
// //               TextFormField(
// //                 controller: _dobController,
// //                 decoration: InputDecoration(
// //                   labelText: "Date of Birth",
// //                   suffixIcon: Icon(Icons.calendar_today),
// //                 ),
// //                 readOnly: true,
// //                 onTap: () async {
// //                   DateTime? pickedDate = await showDatePicker(
// //                     context: context,
// //                     currentDate: DateTime.now().subtract(Duration(days: 365 * 18)),
// //                     initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
// //                     firstDate: DateTime(1900),
// //                     lastDate: DateTime.now(),
// //                   );
// //                   if (pickedDate != null) {
// //                     setState(() {
// //                       _dobController.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
// //                     });
// //                   }
// //                 },
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please select your date of birth";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // City Field
// //               TextFormField(
// //                 controller: _cityController,
// //                 decoration: InputDecoration(labelText: "City"),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please enter your city";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // Gender Field
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 10),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Gender",
// //                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //                     ),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: RadioListTile<String>(
// //                             title: Text("Male"),
// //                             value: "Male",
// //                             groupValue: _gender,
// //                             onChanged: (value) {
// //                               setState(() {
// //                                 _gender = value;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: RadioListTile<String>(
// //                             title: Text("Female"),
// //                             value: "Female",
// //                             groupValue: _gender,
// //                             onChanged: (value) {
// //                               setState(() {
// //                                 _gender = value;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               // Hobbies Field
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 10),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Hobbies",
// //                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //                     ),
// //                     Wrap(
// //                       spacing: 10,
// //                       children: _hobbyOptions.map((hobby) {
// //                         return ChoiceChip(
// //                           label: Text(hobby),
// //                           selected: _hobbies.contains(hobby),
// //                           onSelected: (selected) {
// //                             setState(() {
// //                               if (selected) {
// //                                 _hobbies.add(hobby);
// //                               } else {
// //                                 _hobbies.remove(hobby);
// //                               }
// //                             });
// //                           },
// //                         );
// //                       }).toList(),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               // Password Field
// //               TextFormField(
// //                 controller: _passwordController,
// //                 decoration: InputDecoration(labelText: "Password"),
// //                 obscureText: true,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please enter your password";
// //                   }
// //                   if (value.length < 6) {
// //                     return "Password must be at least 6 characters";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               // Confirm Password Field
// //               TextFormField(
// //                 controller: _confirmPasswordController,
// //                 decoration: InputDecoration(labelText: "Confirm Password"),
// //                 obscureText: true,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return "Please confirm your password";
// //                   }
// //                   if (value != _passwordController.text) {
// //                     return "Passwords do not match";
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 20),
// //               // Submit Button
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     final newUser = {
// //                       "FullName": _fullNameController.text,
// //                       "EmailAddress": _emailController.text,
// //                       "MobileNumber": _mobileController.text,
// //                       "DateOfBirth": _dobController.text,
// //                       "City": _cityController.text,
// //                       "Gender": _gender ?? "Not Specified",
// //                       "Hobbies": _hobbies.join(", "),
// //                       "Password": _passwordController.text,
// //                       "IS_FAVOURITE": widget.user?["IS_FAVOURITE"] ?? 0,
// //                     };
// //
// //                     if (widget.user == null) {
// //                       // Add new user
// //                       ListMethods.addUser(newUser);
// //                     } else {
// //                       // Update existing user
// //                       ListMethods.editUser(widget.user!['ID'], newUser);
// //                     }
// //
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => UserList(),
// //                       ),
// //                     );
// //
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(content: Text(widget.user == null ? "User added successfully!" : "User updated successfully!")),
// //                     );
// //                   }
// //                 },
// //                 child: Text(widget.user == null ? "Save" : "Update"),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // bottonnavigation bar
// //
// //
// // import 'package:flutter/material.dart';
// // import 'AboutUs.dart';
// // import 'AddUser.dart';
// // import 'Favourite.dart';
// // import 'HomePage.dart';
// // import 'UserList.dart';
// //
// // class BottomNaviBar extends StatefulWidget {
// //   const BottomNaviBar({super.key});
// //
// //   @override
// //   State<BottomNaviBar> createState() => _BottomNaviBarState();
// // }
// //
// // class _BottomNaviBarState extends State<BottomNaviBar> {
// //   int _selectedIndex = 0;
// //
// //   // List of screens for BottomNavigationBar
// //   final List<Widget> _screens = [
// //     Homepage(),
// //     AddUser(),
// //     UserList(),
// //     Favourite(),
// //     AboutUs()
// //   ];
// //
// //   // Titles for AppBar corresponding to each screen
// //   final List<String> _titles = [
// //     'Home',
// //     'Add User',
// //     'User List',
// //     'Favourite',
// //     'About Us',
// //   ];
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(_titles[_selectedIndex]),
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background Image
// //           Container(
// //             decoration: BoxDecoration(
// //             ),
// //           ),
// //           // Current screen content
// //           _screens[_selectedIndex],
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person_add),
// //             label: 'Add User',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.list),
// //             label: 'User List',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.favorite),
// //             label: 'Favourite',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.info),
// //             label: 'About Us',
// //           ),
// //         ],
// //         currentIndex: _selectedIndex,
// //         selectedItemColor: Color.fromRGBO(76, 36, 116, 1),
// //         unselectedItemColor: Color.fromRGBO(155, 117, 245, 1),
// //         onTap: _onItemTapped,
// //       ),
// //     );
// //   }
// // }
// //
// //
// // // dashbord screen
// //
// // import 'package:flutter/material.dart';
// // import 'AboutUs.dart';
// // import 'AddUser.dart';
// // import 'Favourite.dart';
// // import 'UserList.dart';
// //
// // class Dashboardscreen extends StatefulWidget {
// //   const Dashboardscreen({super.key});
// //
// //   @override
// //   State<Dashboardscreen> createState() => _DashboardscreenState();
// // }
// //
// // class _DashboardscreenState extends State<Dashboardscreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       appBar: AppBar(
// //         title: Text('Darshan Matrimony'),
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background Image
// //           Container(
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage("assets/images/images.jpg"),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //
// //           // Transparent overlay
// //           Container(
// //             color: Colors.black.withOpacity(0.6),
// //           ),
// //
// //           // Main content
// //           Padding(
// //             padding: EdgeInsets.all(16.0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 // First row
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     buildTile(
// //                       Icons.person_add,
// //                       'Add User',
// //                       Colors.blueAccent,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => AddUser(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                     buildTile(
// //                       Icons.list,
// //                       'User List',
// //                       Colors.deepOrange,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => UserList(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 16), // Spacing between rows
// //
// //                 // Second row
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     buildTile(
// //                       Icons.favorite,
// //                       'Favourite',
// //                       Colors.pinkAccent,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => Favourite(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                     buildTile(
// //                       Icons.info,
// //                       'About Us',
// //                       Colors.green,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => AboutUs(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );;
// //   }
// //
// //   Widget buildTile(IconData icon, String label, Color color, VoidCallback onTap) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(
// //             icon,
// //             size: 48,
// //             color: color, // Icon color
// //           ),
// //           SizedBox(height: 8),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white, // Text color for better contrast
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // favourite page
// //
// // import 'package:flutter/material.dart';
// // import 'package:mymatrimonyapp/NewDesign/Dashboard/UserList.dart';
// // import 'AddUser.dart';
// // import '../../database/ListMethods.dart';
// //
// // class Favourite extends StatefulWidget {
// //   const Favourite({super.key});
// //
// //   @override
// //   State<Favourite> createState() => _FavouriteState();
// // }
// //
// // class _FavouriteState extends State<Favourite> {
// //   void _toggleFavorite(int userId) {
// //     setState(() {
// //       final user = FavouriteUser.LikedUser.firstWhere((user) => user["ID"] == userId);
// //       user["IS_FAVOURITE"] = user["IS_FAVOURITE"] == 1 ? 0 : 1;
// //       if (user["IS_FAVOURITE"] == 0) {
// //         FavouriteUser.deleteFavUser(userId);
// //       }
// //     });
// //   }
// //
// //   void _confirmDelete(BuildContext context, Map<String, dynamic> user) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text("Confirm Delete"),
// //           content: Text("Are you sure you want to delete ${user["FullName"]}?"),
// //           actions: <Widget>[
// //             TextButton(
// //               child: Text("Cancel"),
// //               onPressed: () => Navigator.of(context).pop(),
// //             ),
// //             TextButton(
// //               child: Text("Delete", style: TextStyle(color: Colors.red)),
// //               onPressed: () {
// //                 setState(() {
// //                   ListMethods.deleteUser(user["ID"]);
// //                   FavouriteUser.deleteFavUser(user["ID"]);
// //                 });
// //                 Navigator.of(context).pop();
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(content: Text("${user["FullName"]} deleted successfully!")),
// //                 );
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: FavouriteUser.LikedUser.isEmpty
// //           ? Center(child: Text('No favourite users yet.'))
// //           : ListView.builder(
// //         itemCount: FavouriteUser.LikedUser.length,
// //         itemBuilder: (context, index) {
// //           final user = FavouriteUser.LikedUser[index];
// //           return Center(
// //             child: Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(15),
// //               ),
// //               elevation: 5,
// //               child: Container(
// //                 width: 350,
// //                 padding: EdgeInsets.all(20),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.teal[100],
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       padding: EdgeInsets.symmetric(vertical: 10),
// //                       child: Column(
// //                         children: [
// //                           CircleAvatar(
// //                             radius: 50,
// //                             backgroundImage: AssetImage('assets/profile.jpg'),
// //                           ),
// //                           SizedBox(height: 10),
// //                           Text(
// //                             user["FullName"],
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           Text(
// //                             user["City"],
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.teal,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         InfoRow(label: 'ID', value: user["ID"].toString()),
// //                         InfoRow(label: 'DOB', value: user["DateOfBirth"]),
// //                         InfoRow(label: 'Phone', value: user["MobileNumber"]),
// //                         InfoRow(label: 'E-mail', value: user["EmailAddress"]),
// //                         InfoRow(label: 'Gender', value: user["Gender"]),
// //                         InfoRow(label: 'Hobbies', value: user["Hobbies"]),
// //                       ],
// //                     ),
// //                     SizedBox(height: 20),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                       children: [
// //                         IconButton(
// //                           onPressed: () => _toggleFavorite(user["ID"]),
// //                           icon: Icon(
// //                             user["IS_FAVOURITE"] == 1 ? Icons.favorite : Icons.favorite_border,
// //                             color: Colors.pinkAccent,
// //                           ),
// //                         ),
// //                         IconButton(
// //                           onPressed: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) => AddUser(user: user),
// //                               ),
// //                             ).then((_) {
// //                               setState(() {});
// //                             });
// //                           },
// //                           icon: Icon(
// //                             Icons.edit,
// //                             color: Colors.blue,
// //                           ),
// //                         ),
// //                         IconButton(
// //                           onPressed: () => _confirmDelete(context, user),
// //                           icon: Icon(
// //                             Icons.delete,
// //                             color: Colors.red,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class FavouriteUser {
// //   static List<Map<String, dynamic>> LikedUser = [];
// //
// //   static void addFavUser(Map<String, dynamic> newUser) {
// //     if (!LikedUser.any((user) => user["ID"] == newUser["ID"])) {
// //       LikedUser.add(newUser);
// //     }
// //   }
// //
// //   static void deleteFavUser(int userId) {
// //     LikedUser.removeWhere((user) => user["ID"] == userId);
// //   }
// // }
// //
// //
// // // home page
// //
// //
// // import 'package:flutter/material.dart';
// //
// // import '../Dashboard/AboutUs.dart';
// // import '../Dashboard/AddUser.dart';
// // import 'Favourite.dart';
// // import 'UserList.dart';
// //
// // class Homepage extends StatefulWidget {
// //   const Homepage({super.key});
// //
// //   @override
// //   State<Homepage> createState() => _HomepageState();
// // }
// //
// // class _HomepageState extends State<Homepage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       body: Stack(
// //         children: [
// //           // Main content
// //           Padding(
// //             padding: EdgeInsets.all(16.0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 // First row
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     buildTile(
// //                       Icons.person_add,
// //                       'Add User',
// //                       Colors.blueAccent,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => AddUser(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                     buildTile(
// //                       Icons.list,
// //                       'User List',
// //                       Colors.deepOrange,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => UserList(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 16), // Spacing between rows
// //
// //                 // Second row
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     buildTile(
// //                       Icons.favorite,
// //                       'Favourite',
// //                       Colors.pinkAccent,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => Favourite(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                     buildTile(
// //                       Icons.info,
// //                       'About Us',
// //                       Colors.green,
// //                           () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => AboutUs(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// // }
// // Widget buildTile(IconData icon, String label, Color color, VoidCallback onTap) {
// //   return GestureDetector(
// //     onTap: onTap,
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Icon(
// //           icon,
// //           size: 48,
// //           color: color, // Icon color
// //         ),
// //         SizedBox(height: 8),
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white, // Text color for better contrast
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// //
// // // userlist page
// //
// // import 'package:flutter/material.dart';
// // import 'package:mymatrimonyapp/NewDesign/Dashboard/Favourite.dart';
// //
// // import '../../database/ListMethods.dart';
// // import 'AddUser.dart';
// //
// //
// // class UserList extends StatefulWidget {
// //   const UserList({super.key});
// //
// //   @override
// //   State<UserList> createState() => _UserListState();
// // }
// //
// // class _UserListState extends State<UserList> {
// //   List<Map<String, dynamic>> _userData = ListMethods.Userdata.toList(); // Copy of Userdata
// //
// //   void _toggleFavorite(int userId) {
// //     setState(() {
// //       final user = _userData.firstWhere((user) => user["ID"] == userId);
// //       user["IS_FAVOURITE"] = user["IS_FAVOURITE"] == 1 ? 0 : 1;
// //
// //       if (user["IS_FAVOURITE"] == 1) {
// //         // Add user to LikedUser list
// //         FavouriteUser.addFavUser(user);
// //       } else {
// //         // Remove user from LikedUser list
// //         FavouriteUser.deleteFavUser(userId);
// //       }
// //     });
// //   }
// //
// //   // void _navigateToFavorites() {
// //   //   Navigator.push(
// //   //     context,
// //   //     MaterialPageRoute(
// //   //       builder: (context) => Favourite(
// //   //         favoriteUsers: _userData.where((user) => user["IS_FAVOURITE"] == 1).toList(),
// //   //       ),
// //   //     ),
// //   //   );
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //
// //         body: ListView.builder(
// //           itemCount: _userData.length,
// //           itemBuilder: (context, index) {
// //             final user = _userData[index];
// //             return Center(
// //               child: Card(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //                 elevation: 5,
// //                 child: Container(
// //                   width: 350,
// //                   padding: EdgeInsets.all(20),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           color: Colors.teal[100],
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         padding: EdgeInsets.symmetric(vertical: 10),
// //                         child: Column(
// //                           children: [
// //                             CircleAvatar(
// //                               radius: 50,
// //                               backgroundImage: AssetImage('assets/profile.jpg'),
// //                             ),
// //                             SizedBox(height: 10),
// //                             Text(
// //                               user["FullName"],
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Text(
// //                               user["City"],
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.teal,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       SizedBox(height: 20),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           InfoRow(label: 'ID', value: user["ID"].toString()),
// //                           InfoRow(label: 'DOB', value: user["DateOfBirth"]),
// //                           InfoRow(label: 'Phone', value: user["MobileNumber"]),
// //                           InfoRow(label: 'E-mail', value: user["EmailAddress"]),
// //                           InfoRow(label: 'City', value: user["City"]),
// //                           InfoRow(label: 'Gender', value: user["Gender"]),
// //                           InfoRow(label: 'Hobbies', value: user["Hobbies"]),
// //                         ],
// //                       ),
// //                       SizedBox(height: 20),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {
// //                               _toggleFavorite(user["ID"]);
// //                             },
// //                             icon: Icon(
// //                               user["IS_FAVOURITE"] == 1 ? Icons.favorite : Icons.favorite_border,
// //                               color: Colors.pinkAccent,
// //                             ),
// //                           ),
// //                           IconButton(
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => AddUser(user: user),
// //                                 ),
// //                               ).then((_) {
// //                                 setState(() {
// //                                   _userData = ListMethods.Userdata.toList(); // Refresh the list after update
// //                                 });
// //                               });
// //                             },
// //                             icon: Icon(
// //                               Icons.edit,
// //                               color: Colors.blue,
// //                             ),
// //                           ),
// //                           IconButton(
// //                             onPressed: () {
// //                               setState(() {
// //                                 ListMethods.deleteUser(user["ID"]);
// //                                 _userData.removeWhere((u) => u["ID"] == user["ID"]);
// //                               });
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text("${user["FullName"]} deleted successfully!")),
// //                               );
// //                             },
// //                             icon: Icon(
// //                               Icons.delete,
// //                               color: Colors.red,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class InfoRow extends StatelessWidget {
// //   final String label;
// //   final String value;
// //
// //   const InfoRow({
// //     required this.label,
// //     required this.value,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 5),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             label,
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           Text(
// //             value,
// //             style: TextStyle(
// //               fontSize: 16,
// //               color: Colors.grey[700],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // language page
// //
//
//
// // add user list
//
// import 'package:flutter/material.dart';
// import '../colortheme.dart';
// import '../database/ListMethods.dart';
// import 'UserList.dart';
//
// class AddUser extends StatefulWidget {
//   final Map<String, dynamic>? user;
//
//   AddUser({this.user});
//
//   @override
//   _AddUserState createState() => _AddUserState();
// }
//
// class _AddUserState extends State<AddUser> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers for text fields
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//   TextEditingController();
//
//   String? _gender;
//   List<String> _hobbies = [];
//   final List<String> _hobbyOptions = [
//     'Reading',
//     'Traveling',
//     'Cooking',
//     'Gaming'
//   ];
//
//   int? IS_FAVOURITE;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Pre-fill the fields if user data is provided
//     if (widget.user != null) {
//       _fullNameController.text = widget.user!['FullName'];
//       _emailController.text = widget.user!['EmailAddress'];
//       _mobileController.text = widget.user!['MobileNumber'];
//       _dobController.text = widget.user!['DateOfBirth'];
//       _cityController.text = widget.user!['City'];
//       _gender = widget.user!['Gender'];
//       _hobbies = widget.user!['Hobbies']?.split(', ') ?? [];
//       IS_FAVOURITE = widget.user?['IS_FAVOURITE'] ?? 0;
//       _passwordController.text = widget.user!['Password'];
//       _confirmPasswordController.text =
//       widget.user!['Password']; // Set default confirm password as well
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Full Name Field
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your full name";
//                   }
//                   return null;
//                 },
//               ),
//
//               // Email Address Field
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email Address",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your email address";
//                   }
//                   if (!RegExp(
//                       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
//                       .hasMatch(value)) {
//                     return "Please enter a valid email address";
//                   }
//                   return null;
//                 },
//               ),
//
//               // Mobile Number Field
//               TextFormField(
//                 controller: _mobileController,
//                 decoration: InputDecoration(
//                   labelText: "Mobile Number",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your mobile number";
//                   }
//                   if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
//                     return "Please enter a valid 10-digit mobile number";
//                   }
//                   return null;
//                 },
//               ),
//
//               // Date of Birth Field
//               TextFormField(
//                 controller: _dobController,
//                 decoration: InputDecoration(
//                   labelText: "Date of Birth",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     currentDate:
//                     DateTime.now().subtract(Duration(days: 365 * 18)),
//                     initialDate:
//                     DateTime.now().subtract(Duration(days: 365 * 18)),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (pickedDate != null) {
//                     setState(() {
//                       _dobController.text =
//                       "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
//                     });
//                   }
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please select your date of birth";
//                   }
//                   return null;
//                 },
//               ),
//
//               // City Field
//               TextFormField(
//                 controller: _cityController,
//                 decoration: InputDecoration(
//                   labelText: "City",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your city";
//                   }
//                   return null;
//                 },
//               ),
//
//               // Gender Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Gender",
//                       style:
//                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: RadioListTile<String>(
//                             title: Text("Male",
//                                 style: TextStyle(color: AppColors.textPrimary)),
//                             value: "Male",
//                             groupValue: _gender,
//                             activeColor: AppColors.accent,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = value;
//                               });
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: RadioListTile<String>(
//                             title: Text("Female",
//                                 style: TextStyle(color: AppColors.textPrimary)),
//                             value: "Female",
//                             groupValue: _gender,
//                             activeColor: AppColors.accent,
//                             onChanged: (value) {
//                               setState(() {
//                                 _gender = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//
//               // Hobbies Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Hobbies",
//                       style:
//                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                     Wrap(
//                       spacing: 10,
//                       children: _hobbyOptions.map((hobby) {
//                         return ChoiceChip(
//                           label: Text(hobby,
//                               style: TextStyle(
//                                   color: _hobbies.contains(hobby)
//                                       ? Colors.white
//                                       : AppColors.textPrimary)),
//                           selected: _hobbies.contains(hobby),
//                           selectedColor: AppColors.accent,
//                           backgroundColor: AppColors.background,
//                           onSelected: (selected) {
//                             setState(() {
//                               if (selected) {
//                                 _hobbies.add(hobby);
//                               } else {
//                                 _hobbies.remove(hobby);
//                               }
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               // Password Field
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your password";
//                   }
//                   if (value.length < 6) {
//                     return "Password must be at least 6 characters";
//                   }
//                   return null;
//                 },
//               ),
//
//
//               // Confirm Password Field
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 decoration: InputDecoration(
//                   labelText: "Confirm Password",
//                   labelStyle: TextStyle(color: AppColors.textPrimary),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.surface),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.accent),
//                   ),
//                 ),
//                 style: TextStyle(color: AppColors.textPrimary),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please confirm your password";
//                   }
//                   if (value != _passwordController.text) {
//                     return "Passwords do not match";
//                   }
//                   return null;
//                 },
//               ),
//
//               SizedBox(height: 20),
//
//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final newUser = {
//                       "FullName": _fullNameController.text,
//                       "EmailAddress": _emailController.text,
//                       "MobileNumber": _mobileController.text,
//                       "DateOfBirth": _dobController.text,
//                       "City": _cityController.text,
//                       "Gender": _gender ?? "Not Specified",
//                       "Hobbies": _hobbies.join(", "),
//                       "Password": _passwordController.text,
//                       "IS_FAVOURITE": widget.user?["IS_FAVOURITE"] ?? 0,
//                     };
//
//                     if (widget.user == null) {
//                       // Add new user
//                       ListMethods.addUser(newUser);
//                     } else {
//                       // Update existing user
//                       ListMethods.editUser(widget.user!['ID'], newUser);
//                     }
//
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UserList(),
//                       ),
//                     );
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text(widget.user == null
//                               ? "User added successfully!"
//                               : "User updated successfully!")),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//                 child: Text(
//                   widget.user == null ? "Save" : "Update",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
