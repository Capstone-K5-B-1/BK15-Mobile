class CustomerProfile {
  final int id;
  final String customerId;
  final String fullName;
  final String createdAt;

  CustomerProfile({
    required this.id,
    required this.customerId,
    required this.fullName,
    required this.createdAt,
  });

  factory CustomerProfile.formJson(Map<String, dynamic> json) {
    return CustomerProfile(
      id: json['id'],
      customerId: json['customeer_id'],
      fullName: json['full_name'],
      createdAt: json['created_at'],
    );
  }
}
