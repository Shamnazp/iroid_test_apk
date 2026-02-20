class BannerModel {
  final int id;
  final String title;
  final String subtitle;
  final String image;

  BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
