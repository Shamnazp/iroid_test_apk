import 'package:flutter/material.dart';
import 'package:iroid_apk/core/utils/responsive.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/text_styles.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  final String originalPrice;
  final double rating;
  final String reviews;

  const ProductCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviews,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  List<Widget> _buildStars(double rating, double size) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        stars.add(Icon(Icons.star, size: size, color: const Color(0xFF800080)));
      } else if (rating >= i - 0.5) {
        stars.add(
          Icon(Icons.star_half, size: size, color: const Color(0xFF800080)),
        );
      } else {
        stars.add(
          Icon(Icons.star_border, size: size, color: const Color(0xFF800080)),
        );
      }
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      width: r.width(170),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(r.width(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(r.width(20)),
              topRight: Radius.circular(r.width(20)),
              bottomLeft: Radius.circular(r.width(12)),
              bottomRight: Radius.circular(r.width(12)),
            ),
            child: Stack(
              children: [
                Image.network(
                  widget.imageUrl,
                  height: r.height(150),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: r.height(150),
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.image_not_supported,
                        size: r.width(30),
                        color: Colors.grey,
                      ),
                    );
                  },
                ),

                // Wishlist toggle
                Positioned(
                  top: r.height(8),
                  right: r.width(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      height: r.width(32),
                      width: r.width(32),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: r.width(18),
                        color: isLiked ? Colors.red : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(r.width(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: r.height(10)),

                Row(
                  children: [
                    ..._buildStars(widget.rating, r.width(12)),
                    SizedBox(width: r.width(6)),
                    Text(
                      widget.rating.toString(),
                      style: AppTextStyles.ratingText.copyWith(
                        fontSize: r.width(10),
                      ),
                    ),
                    SizedBox(width: r.width(4)),
                    Text(
                      "(${widget.reviews})",
                      style: AppTextStyles.ratingText.copyWith(
                        fontSize: r.width(10),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: r.height(6)),

                Text(
                  widget.name,
                  style: AppTextStyles.productName.copyWith(
                    fontSize: r.width(14),
                  ),
                ),

                SizedBox(height: r.height(4)),

                Text(
                  widget.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.productDescription.copyWith(
                    fontSize: r.width(12),
                  ),
                ),

                SizedBox(height: r.height(10)),

                Row(
                  children: [
                    Text(
                      widget.price,
                      style: AppTextStyles.price.copyWith(
                        fontSize: r.width(15),
                      ),
                    ),
                    SizedBox(width: r.width(8)),
                    Text(
                      widget.originalPrice,
                      style: AppTextStyles.originalPrice.copyWith(
                        fontSize: r.width(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
