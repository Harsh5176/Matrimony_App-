import 'package:flutter/material.dart';
import '../colortheme.dart';
import '../database/Mydatabase.dart'; // Import the MyDataBase class
import 'UserList.dart';

class AddUser extends StatefulWidget {
  final Map<String, dynamic>? user;

  AddUser({this.user});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _gender;
  List<String> _hobbies = [];
  final List<String> _hobbyOptions = [
    'Reading',
    'Traveling',
    'Cooking',
    'Gaming'
  ];

  int? IS_FAVOURITE;

  @override
  void initState() {
    super.initState();

    // Pre-fill the fields if user data is provided
    if (widget.user != null) {
      _fullNameController.text = widget.user!['FullName'];
      _emailController.text = widget.user!['EmailAddress'];
      _mobileController.text = widget.user!['MobileNumber'];
      _dobController.text = widget.user!['DateOfBirth'];
      _cityController.text = widget.user!['City'];
      _gender = widget.user!['Gender'];
      _hobbies = widget.user!['Hobbies']?.split(', ') ?? [];
      IS_FAVOURITE = widget.user?['IS_FAVOURITE'] ?? 0;
      _passwordController.text = widget.user!['Password'];
      _confirmPasswordController.text =
          widget.user!['Password']; // Set default confirm password as well
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name Field
              _buildTextField(
                controller: _fullNameController,
                labelText: "Full Name",
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),

              // Email Address Field
              _buildTextField(
                controller: _emailController,
                labelText: "Email Address",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email address";
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
                      .hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),

              // Mobile Number Field
              _buildTextField(
                controller: _mobileController,
                labelText: "Mobile Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your mobile number";
                  }
                  if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                    return "Please enter a valid 10-digit mobile number";
                  }
                  return null;
                },
              ),

              // Date of Birth Field
              _buildTextField(
                controller: _dobController,
                labelText: "Date of Birth",
                icon: Icons.calendar_today,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    currentDate:
                        DateTime.now().subtract(Duration(days: 365 * 18)),
                    initialDate:
                        DateTime.now().subtract(Duration(days: 365 * 18)),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dobController.text =
                          "${pickedDate.year}-${pickedDate.month < 9 ? '0' + pickedDate.month.toString() : pickedDate.month.toString()}-${pickedDate.day < 9 ? '0' + pickedDate.day.toString() : pickedDate.day.toString()}";
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select your date of birth";
                  }
                  return null;
                },
              ),

              // City Field
              _buildTextField(
                controller: _cityController,
                labelText: "City",
                icon: Icons.location_city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your city";
                  }
                  return null;
                },
              ),

              // Gender Field
              _buildSectionTitle("Gender", Icons.transgender),
              _buildGenderField(),

              // Hobbies Field
              _buildSectionTitle("Hobbies", Icons.favorite),
              _buildHobbiesField(),

// Password Field
              _buildTextField(
                controller: _passwordController,
                labelText: "Password",
                icon: Icons.lock,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.accent,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

// Confirm Password Field
              _buildTextField(
                controller: _confirmPasswordController,
                labelText: "Confirm Password",
                icon: Icons.lock_outline,
                obscureText: !_isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.accent,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newUser = {
                      "FullName": _fullNameController.text,
                      "EmailAddress": _emailController.text,
                      "MobileNumber": _mobileController.text,
                      "DateOfBirth": _dobController.text,
                      "City": _cityController.text,
                      "Gender": _gender ?? "Not Specified",
                      "Hobbies": _hobbies.join(", "),
                      "Password": _passwordController.text,
                      "IS_FAVOURITE": widget.user?["IS_FAVOURITE"] ?? 0,
                    };

                    final db = MyDataBase();

                    if (widget.user == null) {
                      // Add new user
                      await db.insertUserData(newUser);
                    } else {
                      // Update existing user
                      newUser["ID"] =
                          widget.user!['ID']; // Include the ID for update
                      await db.updateUserData(newUser);
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserList(),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(widget.user == null
                              ? "User added successfully!"
                              : "User updated successfully!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  widget.user == null ? "Save" : "Update",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields with icons
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType? keyboardType,
    bool readOnly = false,
    bool obscureText = false,
    Function()? onTap,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.textPrimary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.surface),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.accent),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(icon, color: AppColors.accent),
          suffixIcon: suffixIcon,
          // <- Added here
          filled: true,
          fillColor: AppColors.background,
        ),
        style: TextStyle(color: AppColors.textPrimary),
        keyboardType: keyboardType,
        readOnly: readOnly,
        obscureText: obscureText,
        onTap: onTap,
        validator: validator,
      ),
    );
  }

  // Helper method to build section titles with icons
  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.accent, size: 20),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the gender field
  Widget _buildGenderField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<String>(
              title:
                  Text("Male", style: TextStyle(color: AppColors.textPrimary)),
              value: "Male",
              groupValue: _gender,
              activeColor: AppColors.accent,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile<String>(
              title: Text("Female",
                  style: TextStyle(color: AppColors.textPrimary)),
              value: "Female",
              groupValue: _gender,
              activeColor: AppColors.accent,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the hobbies field
  Widget _buildHobbiesField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        spacing: 10,
        children: _hobbyOptions.map((hobby) {
          return ChoiceChip(
            label: Text(hobby,
                style: TextStyle(
                    color: _hobbies.contains(hobby)
                        ? Colors.white
                        : AppColors.textPrimary)),
            selected: _hobbies.contains(hobby),
            selectedColor: AppColors.accent,
            backgroundColor: AppColors.background,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _hobbies.add(hobby);
                } else {
                  _hobbies.remove(hobby);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
