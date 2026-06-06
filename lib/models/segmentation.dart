class Segmentation {
  final int id;
  final String customerId;
  final String segmentId;
  final String name;
  final String description;
  final String confidence;
  final String createdAt;

  Segmentation({
    required this.id,
    required this.customerId,
    required this.segmentId,
    required this.name,
    required this.description,
    required this.confidence,
    required this.createdAt,
  });

  factory Segmentation.fromJson(Map<String, dynamic> json) {
    return Segmentation(
      id: json['id'],
      customerId: json['customer_id'],
      segmentId: json['segment_id'],
      name: json['name'],
      description: json['description'],
      confidence: json['confidence'],
      createdAt: json['created_at'],
    );
  }
}
