class BreezyCottonModel {
  final int id;
  final String brand;
  final String title;
  final String image;

  BreezyCottonModel({
    required this.id,
    required this.brand,
    required this.title,
    required this.image,
  });

  factory BreezyCottonModel.fromJson(Map<String, dynamic> json) {
    return BreezyCottonModel(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
