class FriendlyFloralModel {
  final int id;
  final String brand;
  final String title;
  final String image;

  FriendlyFloralModel({
    required this.id,
    required this.brand,
    required this.title,
    required this.image,
  });

  factory FriendlyFloralModel.fromJson(Map<String, dynamic> json) {
    return FriendlyFloralModel(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
