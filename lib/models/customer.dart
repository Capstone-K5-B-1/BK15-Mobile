class Customer {
  final int id;
  final String customerId;
  final String username;
  final String email;
  final String role;
  final String createdAt;

  Customer({
    required this.id,
    required this.customerId,
    required this.username,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      customerId: json['customer_id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      createdAt: json['created_at'],
    );
  }
}
