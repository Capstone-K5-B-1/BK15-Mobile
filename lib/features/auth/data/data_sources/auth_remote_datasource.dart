import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl = 'https://your-api.com'; // Ganti dengan URL API Anda

  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<UserModel?> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({'email': email, 'password': password, 'firstName': firstName, 'lastName': lastName}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> logout() async {
    // Implementasi logout, misalnya hapus token
    await http.post(Uri.parse('$baseUrl/logout'));
  }
}

