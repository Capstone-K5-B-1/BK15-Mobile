import 'package:shared_preferences/shared_preferences.dart';
import '../core/services/api_services.dart';
import '../models/customer.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  /// Logs in a customer using their customer ID.
  /// Returns a [Customer] object upon successful authentication.
  Future<Customer> login(String customerId) async {
    final data = await _apiService.login(customerId);

    // Parse the Customer from response if it is included directly
    if (data.containsKey('customer')) {
      return Customer.fromJson(data['customer'] as Map<String, dynamic>);
    } else if (data.containsKey('username') && data.containsKey('email')) {
      final mergedData = Map<String, dynamic>.from(data);
      if (!mergedData.containsKey('customer_id')) {
        mergedData['customer_id'] = customerId;
      }
      if (!mergedData.containsKey('id')) {
        mergedData['id'] = data['id'] ?? 0;
      }
      return Customer.fromJson(mergedData);
    }

    // Otherwise, fetch user details using the customerId
    final responseData = await _apiService.getUser(customerId);
    final customerData = Map<String, dynamic>.from(responseData);
    
    if (!customerData.containsKey('customer_id') || customerData['customer_id'] == null) {
      customerData['customer_id'] = customerId;
    }
    if (!customerData.containsKey('id') || customerData['id'] == null) {
      customerData['id'] = responseData['id'] ?? 0;
    }

    return Customer.fromJson(customerData);
  }

  /// Logs out the current user by removing authentication tokens from SharedPreferences.
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('customer_id');
    await prefs.remove('role');
  }

  /// Retrieves the current logged-in customer's details, or returns null if not authenticated.
  Future<Customer?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final customerId = prefs.getString('customer_id');

    if (token == null || customerId == null) {
      return null;
    }

    try {
      final customerData = await _apiService.getUser(customerId);
      return Customer.fromJson(customerData);
    } catch (_) {
      // In case the token is invalid or request fails, clear local session
      await logout();
      return null;
    }
  }

  /// Checks if a session token exists in local storage.
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }
}
