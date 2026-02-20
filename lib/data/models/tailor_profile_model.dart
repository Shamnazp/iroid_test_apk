class TailorProfileModel {
  final String name;
  final String designation;
  final String image;
  final bool hasFollowButton;
  final bool hasLikeButton;
  final bool hasShareButton;
  final bool viewMore;

  TailorProfileModel({
    required this.name,
    required this.designation,
    required this.image,
    required this.hasFollowButton,
    required this.hasLikeButton,
    required this.hasShareButton,
    required this.viewMore,
  });

  factory TailorProfileModel.fromJson(Map<String, dynamic> json) {
    return TailorProfileModel(
      name: json['name'] ?? '',
      designation: json['designation'] ?? '',
      image: json['image'] ?? '',
      hasFollowButton: json['has_follow_button'] ?? false,
      hasLikeButton: json['has_like_button'] ?? false,
      hasShareButton: json['has_share_button'] ?? false,
      viewMore: json['view_more'] ?? false,
    );
  }
}
