class ProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double originalPrice;
  final String currency;
  final double rating;
  final String reviewsCount;
  final bool hasWishlist;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.currency,
    required this.rating,
    required this.reviewsCount,
    required this.hasWishlist,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      originalPrice:
          (json['original_price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviews_count'] ?? '',
      hasWishlist: json['has_wishlist'] ?? false,
    );
  }
}
