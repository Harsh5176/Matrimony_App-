import 'package:http/http.dart' as http;
import 'dart:convert';
import '../database/Mydatabase.dart';

class ApiService {
  final String baseUrl = "https://67b2e3c7bc0165def8cf0013.mockapi.io/metrimonyUserData";

  Future<List<dynamic>> fetchAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else{
      return [];
    }
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );
    if (response.statusCode != 201) {
      final db = MyDataBase();
      await db.insertUserData(user);
    }
  }

  Future<void> updateUser(Map<String, dynamic> user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${user["ID"]}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );
    if (response.statusCode != 200) {
      final db = MyDataBase();
      await db.updateUserData(user);
    }
  }

  Future<void> updateFavoriteStatus(int userId, int isFav) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/$userId/favorite'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"IS_FAVOURITE": isFav}),
    );
    if (response.statusCode != 200) {
      final db = MyDataBase();
      await db.updateFavoriteStatus(userId, isFav);
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users/favorites'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      final db = MyDataBase();
      return await db.getFavoriteUsers();
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$userId'));
    if (response.statusCode != 200) {
      final db = MyDataBase();
      await db.deleteUserData(userId);
    }
  }
}
