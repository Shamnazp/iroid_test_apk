class LehengaModel {
  final int id;
  final String title;
  final String subtitle;
  final String brand;
  final String image;

  LehengaModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.brand,
    required this.image,
  });

  factory LehengaModel.fromJson(Map<String, dynamic> json) {
    return LehengaModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      brand: json['brand'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
