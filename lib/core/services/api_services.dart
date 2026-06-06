import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'http://10.0.2.2:8080/api';

  Future<Map<String, dynamic>> login(String customerId, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'customer_id': customerId, 'password': password}),
    );

    final data = _handleResponse(response);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['token']);
    await prefs.setString('customer_id', data['customer_id']);
    await prefs.setString('role', data['role']);

    return data;
  }

  Future<Map<String, dynamic>> getUser(String customerId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/customers/$customerId'),
      headers: await _authHeaders(),
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getAllUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/'),
      headers: await _authHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getUserById(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: await _authHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getUserActivity(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id/activity'),
      headers: await _authHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getUserSegmentation(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id/segment'),
      headers: await _authHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getPersonalization(String customerId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/personalization/$customerId'),
      headers: await _authHeaders(),
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getRecommendation(String customerId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/recommendation/$customerId'),
      headers: await _authHeaders(),
    );

    return _handleResponse(response);
  }

  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(data['error'] ?? "Request failed");
    }

    return data;
  }
}
