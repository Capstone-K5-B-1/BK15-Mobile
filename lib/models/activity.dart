class Activity {
  final int id;
  final String customerId;
  final String activityType;
  final String feature;
  final String metadata;
  final String createdAt;

  Activity({
    required this.id,
    required this.customerId,
    required this.activityType,
    required this.feature,
    required this.metadata,
    required this.createdAt,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      customerId: json['customer_id'],
      activityType: json['activity_type'],
      feature: json['feature'],
      metadata: json['metadata'],
      createdAt: json['created_at'],
    );
  }
}
