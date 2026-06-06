import '../core/services/api_services.dart';
import '../models/customer.dart';
import '../models/segmentation.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  /// Retrieves all users/customers from the database.
  /// Requires admin role.
  Future<List<Customer>> getAllUsers() async {
    final data = await _apiService.getAllUsers();
    final List<dynamic> usersJson = data['users'] ?? [];
    return usersJson.map((json) => Customer.fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Retrieves a specific user/customer by their ID or Customer ID.
  /// Accessible by self or admin.
  Future<Customer> getUser(String id) async {
    final data = await _apiService.getUserById(id);

    // Merge the queried ID to fill the missing fields in Customer model
    final customerData = Map<String, dynamic>.from(data);
    if (!customerData.containsKey('customer_id')) {
      customerData['customer_id'] = id;
    }
    if (!customerData.containsKey('id')) {
      customerData['id'] = int.tryParse(id) ?? 0;
    }

    return Customer.fromJson(customerData);
  }

  /// Retrieves the transactions and frequently used features of a user/customer.
  /// Accessible by self or admin.
  /// Returns a map containing:
  /// - `customer_id`: String
  /// - `transactions`: List of maps (trx_id, type, amount, status, created_at)
  /// - `frequently_used_features`: List of maps (feature, usage_count, last_used_at)
  Future<Map<String, dynamic>> getUserActivity(String id) async {
    final response = await _apiService.getUserActivity(id);
    return response['data'] as Map<String, dynamic>;
  }

  /// Retrieves the segments assigned to a user/customer, including segment details.
  /// Accessible by self or admin.
  Future<List<Segmentation>> getUserSegmentation(String id) async {
    final data = await _apiService.getUserSegmentation(id);
    final String customerId = data['customer_id'] ?? id;
    final List<dynamic> segmentsJson = data['segments'] ?? [];

    return segmentsJson.map((s) {
      final map = s as Map<String, dynamic>;
      return Segmentation(
        id: map['id'] ?? 0,
        customerId: customerId,
        segmentId: (map['id'] ?? 0).toString(),
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        confidence: map['confidence']?.toString() ?? '0.0',
        createdAt: map['assigned_at'] ?? '',
      );
    }).toList();
  }
}