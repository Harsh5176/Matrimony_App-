class ListMethods {
  static List<Map<String, dynamic>> Userdata = [
    {
      "ID": 1,
      "FullName": "John Doe",
      "EmailAddress": "johndoe@example.com",
      "MobileNumber": "1234567890",
      "DateOfBirth": "1990-05-15",
      "City": "New York",
      "Gender": "Male",
      "Hobbies": "Reading, Traveling",
      "Password": "password123",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 2,
      "FullName": "Jane Smith",
      "EmailAddress": "janesmith@example.com",
      "MobileNumber": "9876543210",
      "DateOfBirth": "1985-08-22",
      "City": "Los Angeles",
      "Gender": "Female",
      "Hobbies": "Painting, Cooking",
      "Password": "securepass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 3,
      "FullName": "Alice Johnson",
      "EmailAddress": "alicej@example.com",
      "MobileNumber": "5551234567",
      "DateOfBirth": "1995-03-10",
      "City": "Chicago",
      "Gender": "Female",
      "Hobbies": "Dancing, Singing",
      "Password": "alice123",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 4,
      "FullName": "Bob Brown",
      "EmailAddress": "bobbrown@example.com",
      "MobileNumber": "4445556666",
      "DateOfBirth": "1980-11-30",
      "City": "Houston",
      "Gender": "Male",
      "Hobbies": "Gaming, Movies",
      "Password": "bobpass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 5,
      "FullName": "Charlie Davis",
      "EmailAddress": "charlied@example.com",
      "MobileNumber": "7778889999",
      "DateOfBirth": "1992-07-20",
      "City": "Phoenix",
      "Gender": "Male",
      "Hobbies": "Cycling, Hiking",
      "Password": "charliepass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 6,
      "FullName": "Diana Evans",
      "EmailAddress": "dianae@example.com",
      "MobileNumber": "2223334444",
      "DateOfBirth": "1988-12-05",
      "City": "Philadelphia",
      "Gender": "Female",
      "Hobbies": "Yoga, Gardening",
      "Password": "dianapass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 7,
      "FullName": "Ethan Harris",
      "EmailAddress": "ethanh@example.com",
      "MobileNumber": "6667778888",
      "DateOfBirth": "1998-04-25",
      "City": "San Antonio",
      "Gender": "Male",
      "Hobbies": "Photography, Music",
      "Password": "ethanpass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 8,
      "FullName": "Fiona Clark",
      "EmailAddress": "fionac@example.com",
      "MobileNumber": "9990001111",
      "DateOfBirth": "1993-09-12",
      "City": "San Diego",
      "Gender": "Female",
      "Hobbies": "Writing, Reading",
      "Password": "fionapass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 9,
      "FullName": "George Lewis",
      "EmailAddress": "georgel@example.com",
      "MobileNumber": "3334445555",
      "DateOfBirth": "1987-06-18",
      "City": "Dallas",
      "Gender": "Male",
      "Hobbies": "Fishing, Camping",
      "Password": "georgepass",
      "IS_FAVOURITE": 0
    },
    {
      "ID": 10,
      "FullName": "Hannah Walker",
      "EmailAddress": "hannahw@example.com",
      "MobileNumber": "8889990000",
      "DateOfBirth": "1991-02-14",
      "City": "San Jose",
      "Gender": "Female",
      "Hobbies": "Swimming, Dancing",
      "Password": "hannahpass",
      "IS_FAVOURITE": 0
    }
  ];

  static List<Map<String , dynamic>> displayUser(){
    return Userdata;
  }

  // Method to add a new user
  static void addUser(Map<String, dynamic> newUser) {
    int newId = Userdata.length + 1;
    newUser["ID"] = newId;
    Userdata.add(newUser);
  }

  /// **Method to Delete a User by ID**
  static void deleteUser(int userId) {
    Userdata.removeWhere((user) => user["ID"] == userId);
  }

  /// **Method to Edit an Existing User**
  static void editUser(int userId, Map<String, dynamic> updatedUser) {
    int index = Userdata.indexWhere((user) => user["ID"] == userId);
    if (index != -1) {
      updatedUser["ID"] = userId;
      Userdata[index] = updatedUser;
    }
  }

}
