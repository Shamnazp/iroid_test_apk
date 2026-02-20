import 'package:flutter/material.dart';
import 'package:iroid_apk/core/utils/responsive.dart';

class AllTimeFavCard extends StatelessWidget {
  final String imageUrl;

  const AllTimeFavCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Container(
      width: r.width(206),
      height: r.height(241),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.width(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(r.width(18)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: Icon(
                Icons.image_not_supported,
                size: r.width(40),
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}